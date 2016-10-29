require 'builder'

module HtmlHelper
  def to_table(hashes)
    headers = hashes.first.keys

    html = Builder::XmlMarkup.new(indent: 2)
    html.table do |t|
      t.tr do |tr|
        headers.each { |h| tr.th(h) }
      end
      hashes.each do |row|
        t.tr do |tr|
          headers.each do |h|
            tr.td(row[h])
          end
        end
      end
    end
  end
end
