defmodule Proyecto3Web.PageController do
  use Proyecto3Web, :controller


  def index(conn, _params) do
    render(conn, "index.html")
  end
end
