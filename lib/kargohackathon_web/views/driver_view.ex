defmodule KargohackathonWeb.DriverView do
  use KargohackathonWeb, :view
  alias KargohackathonWeb.DriverView

  def render("index.json", %{drivers: drivers}) do
    %{error: 0,
      error_msg: "",
      data: %{
        drivers: render_many(drivers, DriverView, "driver.json")
        }
      }
  end

  def render("show.json", %{driver: driver}) do
    %{error: 0,
      error_msg: "",
      data: %{driver: render_one(driver, DriverView, "driver.json")}
      }
  end

  def render("success.json",_) do
    %{
      error: 0,
      error_msg: ""
    }
  end

  def render("driver.json", %{driver: driver}) do
    %{id: driver.id,
      driver_name: driver.driver_name,
      phone_number: driver.phone_number,
      ktp_upload: driver.ktp_upload,
      sim_upload: driver.sim_upload,
      status: driver.status}
  end
end
