=begin
  Jekyll tag to include Markdown text from _includes directory preprocessing with Liquid.
  Usage:
    {% markdown %}<markdown text>{% endmarkdown %}
  Source:
    - https://coderwall.com/p/lw1ncw/use-markdown-inside-html-blocks-in-jekyll
    - https://github.com/octopress/markdown-tag/blob/master/lib/octopress-markdown-tag.rb
    - https://github.com/oldtimeguitarguy/karlhepler.com/blob/master/_plugins/markdown-tag.rb
    - http://wolfslittlestore.be/2013/10/rendering-markdown-in-jekyll/
=end
module Jekyll
  class MarkdownBlock < Liquid::Block
        alias_method :render_block, :render

        def initialize(tag_name, markup, tokens)
          super
        end

        # Uses the default Jekyll markdown parser to
        # parse the contents of this block
        def render(context)
          site = context.registers[:site]
          converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
          converter.convert(render_block(context))
        end
  end
end
Liquid::Template.register_tag('markdown', Jekyll::MarkdownBlock)
