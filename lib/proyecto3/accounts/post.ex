defmodule Proyecto3.Accounts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:user, :body])
    |> validate_required([:user, :body])
  end
end
