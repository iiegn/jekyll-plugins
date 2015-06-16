# Adapted from [Jekyll plugins](https://github.com/aucor/jekyll-plugins) by Aucor
# https://github.com/aucor/jekyll-plugins/blob/master/hyphenate.rb

require 'nokogiri'
require 'text/hyphen'
      
module Jekyll
  module HyphenateFilter
        
    def hyphenate(content)

      # Initialize Hyphen 
      # (you can change the language as you wish, we're from Finland ;)
      # note: english is en_us or en_uk not just en
      hh = Text::Hyphen.new(:language => 'en_uk', :left => 2, :right => 2)

      # make sure we find at least one text node
      content = '<span>'+content+'</span>'
      
      # Parse html with Nokogiri
      fragment = Nokogiri::HTML::DocumentFragment.parse(content)     
      
      # Loop through every text node
      fragment.search('*//text()').each do |elem|
          content = elem.content
        
          # Loop through every word
          elem.content.split.each do |w|
            # Replace original word with a hyphenated one
            # unless it is the last word in a paragraph
            if w != elem.content.split.last
              # hack: nokogiri circumscribes '&' with '&amp;' 
              content = content.gsub(w, hh.visualize(w, '#shy;'))
            end
          end
            
          # Replace original paragraph with a hyphenated one
          elem.content = content
      end
      
      # reintroduce '&shy;' instead of '#shy;'
      retval = fragment.inner_html
      retval = retval.gsub('#shy;', '&shy;')
      # Return hyphenated html
      retval
      
    end
    
  end
end

Liquid::Template.register_filter(Jekyll::HyphenateFilter)
