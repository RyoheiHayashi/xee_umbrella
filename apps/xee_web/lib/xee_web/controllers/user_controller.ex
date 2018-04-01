defmodule XeeWeb.UserController do
  use XeeWeb, :controller

  alias Xee.Accounts
  alias Xee.Accounts.User

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: "/host?intro=true")
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:info, "Failed to registration.")
        |> render(conn, "new.html", changeset: changeset)
    end
  end
end
