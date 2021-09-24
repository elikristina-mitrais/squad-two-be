defmodule Kargohackathon.Shipments.Shipment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kargohackathon.Drivers.Driver
  alias Kargohackathon.Trucks.Truck

  schema "shipments" do
    field :assign_to, :string
    field :destination, :string
    field :loading_date, :date
    field :origin, :string
    field :shipment_number, :string, unique: true
    field :status, :string, default: "Assigned"
    belongs_to :truck, Truck
    belongs_to :driver, Driver

    timestamps()
  end

  @doc false
  def changeset(shipment, attrs) do
    shipment
    |> cast(attrs, [:shipment_number, :truck, :driver, :origin, :destination, :loading_date, :assign_to, :status])
    |> validate_required([:origin, :destination])
  end
end
