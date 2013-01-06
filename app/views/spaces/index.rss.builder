xml.instruct!
 
xml.rss("version"    => "2.0",
        "xmlns:dc"   => "http://purl.org/dc/elements/1.1/",
        "xmlns:atom" => "http://www.w3.org/2005/Atom") do
  xml.channel do
    xml.title       "Coworkscape - 登録自由のコワーキングスペース情報サイト -"
    xml.link        "http://www.cowork.so"
    xml.pubDate     Time.now.rfc822
    xml.description "Coworkscapeは、登録自由のコワーキングスペース情報サイトです。全国のコワーキングスペースが一覧で確認できるほか、現在地の近くのコワーキングスペースを検索することができます。"
    xml.atom :link, "href" => "http://www.cowork.so/spaces.rss", "rel" => "self", "type" => "application/rss+xml"
 
    @rss.each do |space|
      xml.item do
        xml.title        space.name
        xml.link         url_for(:only_path => false, :controller=>"/spaces", :action=>"show", :id=> space.id)
        xml.guid         url_for(:only_path => false, :controller=>"/spaces", :action=>"show", :id=> space.id)
        xml.description  space.description
        xml.pubDate      space.created_at.to_formatted_s(:rfc822)
        xml.dc :creator, "Coworkscape"
      end
    end
  end
end