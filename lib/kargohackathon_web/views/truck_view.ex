defmodule KargohackathonWeb.TruckView do
  use KargohackathonWeb, :view
  alias KargohackathonWeb.TruckView

  def render("index.json", %{trucks: trucks}) do
    %{
      error: 0,
      error_msg: "",
      meta: %{
        page: trucks.page,
        limit: trucks.per_page,
        total: trucks.count
      },
      data: %{trucks: render_many(trucks.list, TruckView, "truck.json")}
    }
  end

  def render("show.json", %{truck: truck}) do
    %{error: 0, error_msg: "", data: %{truck: render_one(truck, TruckView, "truck.json")}}
  end

  def render("success.json", %{truck: truck}) do
    %{error: 0, error_msg: ""}
  end

  def render("truck.json", %{truck: truck}) do
    %{
      id: truck.id,
      license_number: truck.license_number,
      truck_type: truck.truck_type,
      plate_type: truck.plate_type,
      production_year: truck.production_year,
      status: truck.status
    }
  end
end
