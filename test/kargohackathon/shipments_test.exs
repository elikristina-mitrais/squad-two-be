defmodule Kargohackathon.ShipmentsTest do
  use Kargohackathon.DataCase

  alias Kargohackathon.Shipments

  describe "shipments" do
    alias Kargohackathon.Shipments.Shipment

    @valid_attrs %{assign_to: "some assign_to", destination: "some destination", driver_id: 42, loading_date: ~D[2010-04-17], origin: "some origin", shipment_number: "some shipment_number", status: "some status", truck_id: 42}
    @update_attrs %{assign_to: "some updated assign_to", destination: "some updated destination", driver_id: 43, loading_date: ~D[2011-05-18], origin: "some updated origin", shipment_number: "some updated shipment_number", status: "some updated status", truck_id: 43}
    @invalid_attrs %{assign_to: nil, destination: nil, driver_id: nil, loading_date: nil, origin: nil, shipment_number: nil, status: nil, truck_id: nil}

    def shipment_fixture(attrs \\ %{}) do
      {:ok, shipment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipments.create_shipment()

      shipment
    end

    test "list_shipments/0 returns all shipments" do
      shipment = shipment_fixture()
      assert Shipments.list_shipments() == [shipment]
    end

    test "get_shipment!/1 returns the shipment with given id" do
      shipment = shipment_fixture()
      assert Shipments.get_shipment!(shipment.id) == shipment
    end

    test "create_shipment/1 with valid data creates a shipment" do
      assert {:ok, %Shipment{} = shipment} = Shipments.create_shipment(@valid_attrs)
      assert shipment.assign_to == "some assign_to"
      assert shipment.destination == "some destination"
      assert shipment.driver_id == 42
      assert shipment.loading_date == ~D[2010-04-17]
      assert shipment.origin == "some origin"
      assert shipment.shipment_number == "some shipment_number"
      assert shipment.status == "some status"
      assert shipment.truck_id == 42
    end

    test "create_shipment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipments.create_shipment(@invalid_attrs)
    end

    test "update_shipment/2 with valid data updates the shipment" do
      shipment = shipment_fixture()
      assert {:ok, %Shipment{} = shipment} = Shipments.update_shipment(shipment, @update_attrs)
      assert shipment.assign_to == "some updated assign_to"
      assert shipment.destination == "some updated destination"
      assert shipment.driver_id == 43
      assert shipment.loading_date == ~D[2011-05-18]
      assert shipment.origin == "some updated origin"
      assert shipment.shipment_number == "some updated shipment_number"
      assert shipment.status == "some updated status"
      assert shipment.truck_id == 43
    end

    test "update_shipment/2 with invalid data returns error changeset" do
      shipment = shipment_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipments.update_shipment(shipment, @invalid_attrs)
      assert shipment == Shipments.get_shipment!(shipment.id)
    end

    test "delete_shipment/1 deletes the shipment" do
      shipment = shipment_fixture()
      assert {:ok, %Shipment{}} = Shipments.delete_shipment(shipment)
      assert_raise Ecto.NoResultsError, fn -> Shipments.get_shipment!(shipment.id) end
    end

    test "change_shipment/1 returns a shipment changeset" do
      shipment = shipment_fixture()
      assert %Ecto.Changeset{} = Shipments.change_shipment(shipment)
    end
  end
end
