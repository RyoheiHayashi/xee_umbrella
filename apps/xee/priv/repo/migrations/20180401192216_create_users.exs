defmodule Xee.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false;
      add :encrypted_password, :string, null: false;

      timestamps()
    end

    # add unique constraints to users.name
    create unique_index(:users, [:name])

  end
end
