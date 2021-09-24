defmodule Kargohackathon.Repo.Migrations.CreateShipments do
  use Ecto.Migration

  def change do
    create table(:shipments) do
      add :shipment_number, :string
      add :origin, :string
      add :destination, :string
      add :loading_date, :date
      add :assign_to, :string
      add :status, :string, default: "Active"
      add :truck_id, references(:trucks)
      add :driver_id, references(:drivers)

      timestamps()
    end
  end
end
