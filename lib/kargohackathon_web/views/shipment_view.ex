defmodule KargohackathonWeb.ShipmentView do
  use KargohackathonWeb, :view
  alias KargohackathonWeb.ShipmentView

  def render("index_transporter.json", %{shipments: shipments}) do
    %{
      error: 0,
      error_msg: "",
      meta: %{
        page: shipments.page,
        limit: shipments.per_page,
        total: shipments.count
      },
      data: %{shipments: render_many(shipments.list, ShipmentView, "shipment.json")}
    }
  end

  def render("index.json", %{shipments: shipments}) do
    %{
      error: 0,
      error_msg: "",
      data: %{
        shipments: render_many(shipments.list, ShipmentView, "shipment.json")
      },
      meta: %{
        page: shipments.page,
        limit: shipments.per_page,
        total: shipments.count
      }
    }
  end

  def render("show.json", %{shipment: shipment}) do
    %{
      error: 0,
      error_msg: "",
      data: %{shipments: render_one(shipment, ShipmentView, "shipment.json")}
    }
  end

  def render("success.json", _) do
    %{error: 0, error_msg: ""}
  end

  def render("shipment.json", %{shipment: shipment}) do
    %{
      id: shipment.id,
      shipment_number: shipment.shipment_number,
      license_number: shipment.truck.license_number,
      driver_name: shipment.driver.driver_name,
      origin: shipment.origin,
      destination: shipment.destination,
      loading_date: shipment.loading_date,
      assign_to: shipment.assign_to,
      status: shipment.status
    }
  end
end
