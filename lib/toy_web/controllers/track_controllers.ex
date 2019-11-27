defmodule ToyWeb.TracksController do
  use ToyWeb, :controller

  def index(conn, params) do
    {:ok, message} = Jason.encode(params)
    ToyWeb.Worker.publish(message)
    conn |> text("200")
  end
end
