defmodule TestJson.Repo do
  use Ecto.Repo,
    otp_app: :test_json,
    adapter: Ecto.Adapters.Postgres
end
