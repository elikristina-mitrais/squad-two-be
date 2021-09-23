defmodule Kargohackathon.Repo do
  use Ecto.Repo,
    otp_app: :kargohackathon,
    adapter: Ecto.Adapters.Postgres
end
