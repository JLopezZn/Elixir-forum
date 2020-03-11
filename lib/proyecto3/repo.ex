defmodule Proyecto3.Repo do
  use Ecto.Repo,
    otp_app: :proyecto3,
    adapter: Ecto.Adapters.MyXQL
end
