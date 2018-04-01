defmodule Xee.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Xee.Accounts.User

  schema "users" do
    field :name, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  def changeset(%User{} = user, attrs \\ :empty) do
    user
    |> cast(attrs, [:name, :password])
    |> validate_required([:name, :password])
    |> unique_constraint(:name)
    |> validate_length(:name, min: 1)
    |> validate_length(:password, min: 5)
    |> update_change(:name, &String.downcase/1)
    |> put_change(:encrypted_password, hashed_password(attrs["password"]))
  end

  defp hashed_password(password) do
    case password do
        nil -> ""
        _ -> Comeonin.Pbkdf2.hashpwsalt(password)
    end
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password])
    |> validate_required([:name, :password])
  end
end
