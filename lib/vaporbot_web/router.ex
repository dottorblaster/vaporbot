defmodule VaporbotWeb.Router do
  use VaporbotWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VaporbotWeb do
    # Use the default browser stack
    pipe_through :api

    get "/", PageController, :index
    post "/vaporfont", PageController, :vaporfont
    post "/webhook", PageController, :webhook
  end

  # Other scopes may use custom stacks.
  # scope "/api", VaporbotWeb do
  #   pipe_through :api
  # end
end
