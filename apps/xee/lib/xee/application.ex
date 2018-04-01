defmodule Xee.Application do
  @moduledoc """
  The Xee Application Service.

  The Xee system business domain lives in this application.

  Exposes API to clients such as the `XeeWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Xee.Repo, []),
    ], strategy: :one_for_one, name: Xee.Supervisor)
  end
end
