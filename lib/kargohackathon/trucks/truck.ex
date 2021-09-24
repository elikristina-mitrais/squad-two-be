defmodule Kargohackathon.Trucks.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :kir_upload, :string
    field :license_number, :string
    field :plate_type, :string
    field :production_year, :string
    field :status, :string
    field :stnk_upload, :string
    field :truck_type, :string
    has_many :shipment, {"shipment_number", Kargohackathon.Shipments.Shipment}

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:license_number, :truck_type, :plate_type, :production_year, :stnk_upload, :kir_upload, :status])
    |> validate_required([:license_number, :truck_type, :plate_type])
  end
end
