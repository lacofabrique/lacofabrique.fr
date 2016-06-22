# encoding: utf-8
# page_title tag for Jekyll
# Generate the page title that should be different on the homepage and the other pages

# Developer: Benjamin Danon <benjamin@sphax3d.org> http://sphax3d.org
# Licence  : WTFPL (http://sam.zoy.org/wtfpl/COPYING)
# Version  : 0.2 (March 2016)

# Usage:
#   Add the tag {% page_title %} in a file that will be converted
#   This plugin use site.title, site.tagline and page.title

module Jekyll
  class PageTitleTag < Liquid::Tag
    def render(context)
      context = context.environments.first
      site_title = [ context["site"]["title"], context["site"]["tagline"].uncapitalize ].join(", ")
      page_title = site_title
      page_title = [ context["page"]["title"], site_title ].join(" ⋅ ") if context["page"]["title"]
      return page_title
    end
  end
end

Liquid::Template.register_tag('page_title', Jekyll::PageTitleTag)
