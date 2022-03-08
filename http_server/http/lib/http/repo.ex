defmodule Http.Repo do
  use Ecto.Repo,
    otp_app: :http,
    adapter: Ecto.Adapters.Postgres
end
