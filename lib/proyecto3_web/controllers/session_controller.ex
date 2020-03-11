defmodule Proyecto3Web.SessionController do
    use Proyecto3Web, :controller
    alias Proyecto3.Accounts

    def new(conn, _params)do
        render(conn, "new.html")
    end

    def create(conn, %{"session" => auth_params})do
        user = Accounts.get_user_by_username(auth_params["username"])
        
        if user do
            if auth_params["password"] == user.password do
                conn
                |> put_session(:current_img, user.link)
                |> put_session(:current_username, user.username)
                |> put_session(:current_user_id, user.id)
                |> put_flash(:info, "Se inició la sesión correctamente.")
                |> redirect(to: Routes.post_path(conn, :index))
                else
                conn
                |> put_flash(:info, "Hubo un error.")
                |> render("new.html")
            end
        else
            conn
            |> put_flash(:info, "Hubo un error.")
            |> render("new.html")
        end
    end

    def delete(conn, _params)do
        conn
        |> delete_session(:current_img)
        |> delete_session(:current_username)
        |> delete_session(:current_user_id)
        |> put_flash(:info, "Se cerró la sesión correctamente.")
        |> redirect(to: Routes.post_path(conn, :index))
    end
end