require 'nokogiri'
require 'open-uri'
require 'pry'

url = 'https://wiki.debian.org/DebianReleases'
html = open(url).read
doc = Nokogiri::HTML(html)

# 表のタイトル
puts doc.xpath("//h2[@id='Production_Releases']").text

# 要素一覧（タブ揃え）
doc.xpath("//tr").each do |node|
  break if /(EOL)/ =~ node.text
  puts node.text.gsub(/(\ )/,"").gsub(/(\n)/, "\t")
end

