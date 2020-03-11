defmodule Proyecto3.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :link, :string
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :link])
    |> validate_required([:username, :password, :link])
  end
end
