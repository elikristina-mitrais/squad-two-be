defmodule KargohackathonWeb.TruckController do
  use KargohackathonWeb, :controller

  alias Kargohackathon.Trucks
  alias Kargohackathon.Trucks.Truck

  action_fallback KargohackathonWeb.FallbackController

  def index(conn, params) do
    page = params["page"] || 1

    trucks = Trucks.list_trucks(:paged, page)
    render(conn, "index.json", trucks: trucks)
  end

  def create(conn, %{"truck" => truck_params}) do
    with {:ok, %Truck{} = truck} <- Trucks.create_truck(truck_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.truck_path(conn, :show, truck))
      |> render("success.json", truck: truck)
    end
  end

  def show(conn, %{"id" => id}) do
    truck = Trucks.get_truck!(id)
    render(conn, "show.json", truck: truck)
  end

  def update(conn, %{"id" => id, "truck" => truck_params}) do
    truck = Trucks.get_truck!(id)

    with {:ok, %Truck{} = truck} <- Trucks.update_truck(truck, truck_params) do
      render(conn, "success.json", truck: truck)
    end
  end

  def delete(conn, %{"id" => id}) do
    truck = Trucks.get_truck!(id)

    with {:ok, %Truck{}} <- Trucks.delete_truck(truck) do
      send_resp(conn, :no_content, "")
    end
  end
end
