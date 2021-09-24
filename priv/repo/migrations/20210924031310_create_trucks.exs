defmodule Kargohackathon.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :license_number, :string, [size: 15, null: false]
      add :truck_type, :string, [size: 50, null: false]
      add :plate_type, :string, null: false
      add :production_year, :string, [size: 4, null: false]
      add :stnk_upload, :string, null: true
      add :kir_upload, :string, null: true
      add :status, :string, [default: "active", null: false]

      timestamps()
    end

    create constraint("trucks", :plate_type_value, check: "plate_type IN ('black', 'yellow')")
    create constraint("trucks", :status_value, check: "status IN ('active', 'inactive')")

  end
end