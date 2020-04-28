require 'open-uri'

class LinkService
  def link_for_url(url)
    link = nil
    URI.open(url) do |f|
      f.each_line do |line|
        link = line.scan(/^\s+mediaCollection\.addMediaStream\(1,\s2,\s"",\s"(.*)",\s"default"\);/)
        break if link.length > 0
      end
    end
    link.flatten[0] unless link.length == 0
  end
end
