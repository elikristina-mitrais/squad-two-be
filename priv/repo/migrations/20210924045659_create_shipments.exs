defmodule Kargohackathon.Repo.Migrations.CreateShipments do
  use Ecto.Migration

  def change do
    create table(:shipments) do
      add :shipment_number, :string
      add :truck_id, :integer
      add :driver_id, :integer
      add :origin, :string
      add :destination, :string
      add :loading_date, :date
      add :assign_to, :string
      add :status, :string, default: "Active"

      timestamps()
    end

    create constraint("shipments", :value_status, check: "status IN ('Active', 'Inactive')")

  end
end
