defmodule ToyWeb.Router do
  use ToyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ToyWeb do
    pipe_through :api

    get "/t", TracksController, :index

  end
end
