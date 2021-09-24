defmodule KargohackathonWeb.ShipmentController do
  use KargohackathonWeb, :controller

  alias Kargohackathon.Shipments
  alias Kargohackathon.Shipments.Shipment

  action_fallback KargohackathonWeb.FallbackController

  def index(conn, params) do
    page = params["page"] || 1

    shipments = Shipments.list_shipments(:paged, page)
    render(conn, "index.json", shipments: shipments)
  end

  def index_transporter(conn, params) do
    page = params["page"] || 1

    shipments = Shipments.list_shipment_transporter(:paged, page)
    render(conn, "index_transporter.json", shipments: shipments)
  end

  def create(conn, %{"shipment" => shipment_params}) do
    with {:ok, %Shipment{} = shipment} <- Shipments.create_shipment(shipment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.shipment_path(conn, :show, shipment))
      |> render("show.json", shipment: shipment)
    end
  end

  def show(conn, %{"id" => id}) do
    shipment = Shipments.get_shipment!(id)
    render(conn, "show.json", shipment: shipment)
  end

  def update(conn, %{"id" => id, "shipment" => shipment_params}) do
    shipment = Shipments.get_shipment!(id)

    with {:ok, %Shipment{} = shipment} <- Shipments.update_shipment(shipment, shipment_params) do
      render(conn, "success.json", shipment: shipment)
    end
  end

  def allocate(conn, %{"id" => id, "shipment" => shipment_params}) do
    shipment = Shipments.get_shipment_transporter!(id)

    with {:ok, %Shipment{} = shipment} <- Shipments.allocate_shipment(shipment, shipment_params) do
      render(conn, "show.json", shipment: shipment)
    end
  end

  def delete(conn, %{"id" => id}) do
    shipment = Shipments.get_shipment!(id)

    with {:ok, %Shipment{}} <- Shipments.delete_shipment(shipment) do
      send_resp(conn, :no_content, "")
    end
  end
end
