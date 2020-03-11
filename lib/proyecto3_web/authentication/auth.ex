defmodule Proyecto3Web.Authentications.Auth do
    def signed_in?(conn) do
        user_id = Plug.Conn.get_session(conn, :current_user_id)
        if user_id, do: !!Proyecto3.Repo.get(Proyecto3.Accounts.User, user_id)
    end
end