defmodule Kargohackathon.Drivers.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :driver_name, :string
    field :ktp_upload, :string
    field :phone_number, :string
    field :sim_upload, :string
    field :status, :string, default: "Active"
    has_many :shipment, {"shipment_number", Kargohackathon.Shipments.Shipment}

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:driver_name, :phone_number, :ktp_upload, :sim_upload, :status])
    |> validate_required([:driver_name, :phone_number, :status])
    |> validate_inclusion(:status, ["Active", "Inactive"])
  end
end
