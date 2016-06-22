# encoding: utf-8
# page_header tag for Jekyll
# Generate the page header that should be different on the homepage and the other pages

# Developer: Benjamin Danon <benjamin@sphax3d.org> http://sphax3d.org
# Licence  : WTFPL (http://sam.zoy.org/wtfpl/COPYING)
# Version  : 0.2 (March 2016)

# Usage:
#   Add the tag {% page_header %} in a file that will be converted
#   This plugin use site.title, site.tagline, page.title and the following methods to render the header :
#   - PageHeaderTag::page_header_home
#   - PageHeaderTag::page_header_page
#   This following variables are available in methods : @context, @site_title, @site_tagline, @page_title

module Jekyll
  class PageHeaderTag < Liquid::Tag
    def render(context)
      @context = context
      context = context.environments.first
      @site_title = context["site"]["title"]
      @site_tagline = context["site"]["tagline"].capitalize_first_char
      @page_title = context["page"]["title"]
      return page_header_home if context["page"]["url"] == "/"
      return page_header_page
    end

    def page_header_home
      banner = "bureau-lacofabrique.jpg"
      "<h1 class=\"site-title fn org\">#{@site_title}</h1>\n" + \
      "<div class=\"tagline\">#{@site_tagline}</div>\n" + \
      Liquid::Template.parse("{% img #{banner} alt:'Bureau de La Cofabrique' class:'photo' %}").render(@context)
    end

    def page_header_page
      banner = "placekitten-940-288.jpg"
      "<div class=\"site-title\"><a href=\"/\" title=\"Retour à la page d’accueil\">#{@site_title}</a></div>\n" + \
      "<h1 class=\"page-title\">#{@page_title}</h1>" + \
      Liquid::Template.parse("{% img #{banner} alt:'Petits chats' %}").render(@context)
    end
  end
end

Liquid::Template.register_tag('page_header', Jekyll::PageHeaderTag)
