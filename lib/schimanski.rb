require "sinatra"
require "net/http"
require "json"

class Schimanski < Sinatra::Base
  get "/health" do
    "Schimanski is ready to solve the next case"
  end

  get "/" do
    <<-HTML
<center>
<h2>Get download urls here</h2>

</center>
    HTML
  end
end