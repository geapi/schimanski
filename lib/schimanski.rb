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
    link_service = LinkService.new
    link = link_service.link_for_url(movie_url)
    p link
    p movie_url
    haml :index, locals: { link: link, movie_url: movie_url }
  end

  get "/" do
    haml :new
  end
end