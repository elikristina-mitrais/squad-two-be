defmodule Kargohackathon.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :driver_name, :string
      add :phone_number, :string
      add :ktp_upload, :string
      add :sim_upload, :string
      add :status, :string

      timestamps()
    end

    create constraint("drivers", :value_status, check: "status IN ('Active', 'Inactive')")

  end
end
