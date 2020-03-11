defmodule Proyecto3Web.Router do
  use Proyecto3Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Proyecto3Web do
    pipe_through :browser

    resources "/posts", PostController
    resources "/register", UserController, only: [:new, :create]
    get "/", PostController, :index

    get "/sign-in", SessionController, :new
    post "/sign-in", SessionController, :create
    delete "/sign-out", SessionController, :delete
    
  end

  # Other scopes may use custom stacks.
  # scope "/api", Proyecto3Web do
  #   pipe_through :api
  # end
end
