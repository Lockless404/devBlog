require "rails_helper"

RSpec.describe "Posts", :type => :request do
  it "redirects and renders to the Posts page" do
    get "/users/:user_id/posts"
    expect(response).to render_template(:index)
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Posts for a given user.")
  end

  it "redirects and renders to the specific post" do
    get "/users/:user_id/posts/:id"
    expect(response).to render_template(:show)
    expect(response).to have_http_status(:ok)
    expect(response.body).to include("The specific post")
  end
end