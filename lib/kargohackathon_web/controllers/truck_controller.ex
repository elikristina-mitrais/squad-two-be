defmodule KargohackathonWeb.TruckController do
  use KargohackathonWeb, :controller

  alias Kargohackathon.Schema
  alias Kargohackathon.Schema.Truck

  action_fallback KargohackathonWeb.FallbackController

  def index(conn, params) do
    page = params["page"] || 1

    trucks = Schema.list_trucks(:paged, page)
    render(conn, "index.json", trucks: trucks)
  end

  def create(conn, %{"truck" => truck_params}) do
    with {:ok, %Truck{} = truck} <- Schema.create_truck(truck_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.truck_path(conn, :show, truck))
      |> render("show.json", truck: truck)
    end
  end

  def show(conn, %{"id" => id}) do
    truck = Schema.get_truck!(id)
    render(conn, "show.json", truck: truck)
  end

  def update(conn, %{"id" => id, "truck" => truck_params}) do
    truck = Schema.get_truck!(id)

    with {:ok, %Truck{} = truck} <- Schema.update_truck(truck, truck_params) do
      render(conn, "show.json", truck: truck)
    end
  end

  def delete(conn, %{"id" => id}) do
    truck = Schema.get_truck!(id)

    with {:ok, %Truck{}} <- Schema.delete_truck(truck) do
      send_resp(conn, :no_content, "")
    end
  end
end
