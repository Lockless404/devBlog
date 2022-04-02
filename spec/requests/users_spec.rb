require "rails_helper"

RSpec.describe "Users", :type => :request do
  it "redirects and renders to the users page" do
    get "/users"
    expect(response).to render_template(:index)
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("List of users")
  end

  it "redirects and renders to the specific user page" do
    get "/users/:id"
    expect(response).to render_template(:show)
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("The specific user")
  end
end