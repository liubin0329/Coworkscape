# this procudes the <?xml ... ?> tag at the start of the document
#   note: this is different to calling builder normally as the <?xml?> tag
#         is very different to how you'd write a normal tag!
xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
xml.url {
    xml.loc('http://www.cowork.so/')
    xml.changefreq('daily')
    xml.priority('0.9')
}
xml.url {
    xml.loc('http://www.cowork.so/spaces')
    xml.changefreq('daily')
    xml.priority('0.5')
}
xml.url {
    xml.loc('http://www.cowork.so/about')
    xml.changefreq('monthly')
    xml.priority('0.5')
}
xml.url {
    xml.loc('http://www.cowork.so/privacy')
    xml.changefreq('monthly')
    xml.priority('0.3')
}
xml.url {
    xml.loc('http://www.cowork.so/terms')
    xml.changefreq('monthly')
    xml.priority('0.3')
}

# create the urlset

  # photo pages
  @spaces.each do |space|
    xml.url do # create the url entry, with the specified location and date
      xml.loc space_url(space)
      xml.lastmod space.updated_at.strftime('%Y-%m-%d')
      xml.changefreq('monthly')
      xml.priority('0.5')
    end
  end
  
  # photo pages
  @pref.each do |p|
    xml.url do # create the url entry, with the specified location and date
      xml.loc "http://www.cowork.so/spaces/" + p[0].to_s + "/category"
      xml.changefreq('daily')
      xml.priority('0.5')
    end
  end
  
end