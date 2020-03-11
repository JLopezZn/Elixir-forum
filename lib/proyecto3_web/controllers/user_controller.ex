defmodule Proyecto3Web.UserController do
  use Proyecto3Web, :controller

  alias Proyecto3.Accounts
  alias Proyecto3.Accounts.User


  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_img, user.link)
        |> put_session(:current_username, user.username)
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Bienvenido a Thoughts.")
        |> redirect(to: Routes.post_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
