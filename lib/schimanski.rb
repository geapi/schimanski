require "sinatra"
require "net/http"
require "json"
require_relative "link_service"

class Schimanski < Sinatra::Base
  get "/health" do
    "Schimanski is ready to solve the next case"
  end

  post "/" do
    movie_url = params[:url]

    if uri?(movie_url)
      link_service = LinkService.new
      link = link_service.link_for_url(movie_url)
    else
      movie_url = "not a valid mediathek link"
    end
    haml :index, locals: {link: link, movie_url: movie_url}
  end

  get "/" do
    haml :new
  end


  def uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end
end