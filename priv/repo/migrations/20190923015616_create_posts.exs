defmodule Proyecto3.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :user, :string
      add :body, :text

      timestamps()
    end

  end
end
