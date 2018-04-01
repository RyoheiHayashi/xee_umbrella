defmodule XeeWeb.Application do
  use Application

  @channel_onetime_server_name :ChannelOnetime
  def channel_token_onetime, do: @channel_onetime_server_name

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(XeeWeb.Endpoint, []),
      # Start your own worker by calling: XeeWeb.Worker.start_link(arg1, arg2, arg3)
      # worker(XeeWeb.Worker, [arg1, arg2, arg3]),
      worker(Xee.HostServer, []),
      worker(Xee.TokenServer, []),
      worker(Xee.ExperimentServer, []),
      worker(Xee.ThemeServer, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: XeeWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    XeeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
