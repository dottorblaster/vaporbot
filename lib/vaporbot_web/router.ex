defmodule VaporbotWeb.Router do
  use VaporbotWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VaporbotWeb do
    pipe_through :api # Use the default browser stack

    get "/", PageController, :index
    post "/vaporfont", PageController, :vaporfont
    post "/webhook", PageController, :webhook
  end

  # Other scopes may use custom stacks.
  # scope "/api", VaporbotWeb do
  #   pipe_through :api
  # end
end
