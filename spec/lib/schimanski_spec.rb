require_relative "../spec_helper"
require "net/http"

describe "Schimanski" do
  it "responds to GET/health" do
    get "/health"

    expect(last_response).to be_ok
    expect(last_response.body).to match(/TSchimanski is ready to solve the next case/)
  end

  it "gets download urls" do
    get "/"

    expect(last_response).to be_ok
    expect(last_response.body).to match(/Get download urls here/)
  end
end