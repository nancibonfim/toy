defmodule Toy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  use Supervisor

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      # Starts a worker by calling: Toy.Worker.start_link(arg)
      # {Toy.Worker, arg},
      supervisor(ToyWeb.Endpoint, []),
      worker(ToyWeb.Worker, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Toy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ToyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end