defmodule KargohackathonWeb.ShipmentView do
  use KargohackathonWeb, :view
  alias KargohackathonWeb.ShipmentView

  def render("index.json", %{shipments: shipments}) do
    %{data: render_many(shipments, ShipmentView, "shipment.json")}
  end

  def render("show.json", %{shipment: shipment}) do
    %{data: render_one(shipment, ShipmentView, "shipment.json")}
  end

  def render("shipment.json", %{shipment: shipment}) do
    %{id: shipment.id,
      shipment_number: shipment.shipment_number,
      truck_id: shipment.truck_id,
      driver_id: shipment.driver_id,
      origin: shipment.origin,
      destination: shipment.destination,
      loading_date: shipment.loading_date,
      assign_to: shipment.assign_to,
      status: shipment.status}
  end
end
