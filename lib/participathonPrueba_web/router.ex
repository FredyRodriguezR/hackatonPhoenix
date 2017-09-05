defmodule ParticipathonPruebaWeb.Router do
  use ParticipathonPruebaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ParticipathonPruebaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/usuarios", UsersController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ParticipathonPruebaWeb do
  #   pipe_through :api
  # end
end
