defmodule Kargohackathon.Shipments.Shipment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shipments" do
    field :assign_to, :string
    field :destination, :string
    field :driver_id, :integer
    field :loading_date, :date
    field :origin, :string
    field :shipment_number, :string, unique: true
    field :status, :string, default: "Active"
    field :truck_id, :integer

    timestamps()
  end

  @doc false
  def changeset(shipment, attrs) do
    shipment
    |> cast(attrs, [:shipment_number, :truck_id, :driver_id, :origin, :destination, :loading_date, :assign_to, :status])
    |> validate_required([:shipment_number, :origin, :destination, :loading_date, :status])
    |> validate_inclusion(:status, ["Active", "Inactive"])
  end
end
