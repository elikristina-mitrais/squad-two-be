defmodule KargohackathonWeb.ShipmentControllerTest do
  use KargohackathonWeb.ConnCase

  alias Kargohackathon.Shipments
  alias Kargohackathon.Shipments.Shipment

  @create_attrs %{
    assign_to: "some assign_to",
    destination: "some destination",
    driver_id: 42,
    loading_date: ~D[2010-04-17],
    origin: "some origin",
    shipment_number: "some shipment_number",
    status: "some status",
    truck_id: 42
  }
  @update_attrs %{
    assign_to: "some updated assign_to",
    destination: "some updated destination",
    driver_id: 43,
    loading_date: ~D[2011-05-18],
    origin: "some updated origin",
    shipment_number: "some updated shipment_number",
    status: "some updated status",
    truck_id: 43
  }
  @invalid_attrs %{assign_to: nil, destination: nil, driver_id: nil, loading_date: nil, origin: nil, shipment_number: nil, status: nil, truck_id: nil}

  def fixture(:shipment) do
    {:ok, shipment} = Shipments.create_shipment(@create_attrs)
    shipment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all shipments", %{conn: conn} do
      conn = get(conn, Routes.shipment_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create shipment" do
    test "renders shipment when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shipment_path(conn, :create), shipment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.shipment_path(conn, :show, id))

      assert %{
               "id" => id,
               "assign_to" => "some assign_to",
               "destination" => "some destination",
               "driver_id" => 42,
               "loading_date" => "2010-04-17",
               "origin" => "some origin",
               "shipment_number" => "some shipment_number",
               "status" => "some status",
               "truck_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shipment_path(conn, :create), shipment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update shipment" do
    setup [:create_shipment]

    test "renders shipment when data is valid", %{conn: conn, shipment: %Shipment{id: id} = shipment} do
      conn = put(conn, Routes.shipment_path(conn, :update, shipment), shipment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.shipment_path(conn, :show, id))

      assert %{
               "id" => id,
               "assign_to" => "some updated assign_to",
               "destination" => "some updated destination",
               "driver_id" => 43,
               "loading_date" => "2011-05-18",
               "origin" => "some updated origin",
               "shipment_number" => "some updated shipment_number",
               "status" => "some updated status",
               "truck_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, shipment: shipment} do
      conn = put(conn, Routes.shipment_path(conn, :update, shipment), shipment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete shipment" do
    setup [:create_shipment]

    test "deletes chosen shipment", %{conn: conn, shipment: shipment} do
      conn = delete(conn, Routes.shipment_path(conn, :delete, shipment))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.shipment_path(conn, :show, shipment))
      end
    end
  end

  defp create_shipment(_) do
    shipment = fixture(:shipment)
    %{shipment: shipment}
  end
end
