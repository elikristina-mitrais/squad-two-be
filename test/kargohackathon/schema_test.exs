defmodule Kargohackathon.SchemaTest do
  use Kargohackathon.DataCase

  alias Kargohackathon.Schema

  describe "trucks" do
    alias Kargohackathon.Trucks.Truck

    @valid_attrs %{
      license_number: "BK 3001 DEF",
      truck_type: "Container",
      plate_type: "Yellow",
      production_year: "2000",
      stnk_upload: "",
      kir_upload: "",
      status: "Active"
    }
    @update_attrs %{
      license_number: "BK 3001 DEF",
      truck_type: "Container",
      plate_type: "Yellow",
      production_year: "2000",
      stnk_upload: "",
      kir_upload: ""
    }
    @invalid_attrs %{license_number: nil, plate_type: nil, truck_type: nil}

    def truck_fixture(attrs \\ %{}) do
      {:ok, truck} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schema.create_truck()

      truck
    end

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert Schema.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Schema.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      assert {:ok, %Truck{} = truck} = Schema.create_truck(@valid_attrs)
      assert truck.license_number == "BK 3001 DEF"
      assert truck.plate_type == "Yellow"
      assert truck.production_year == "2000"
      assert truck.status == "Active"
      assert truck.truck_type == "Container"
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{} = truck} = Schema.update_truck(truck, @update_attrs)
      assert truck.license_number == "BK 3001 DEF"
      assert truck.plate_type == "Yellow"
      assert truck.production_year == "2000"
      assert truck.truck_type == "Container"
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_truck(truck, @invalid_attrs)
      assert truck == Schema.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Schema.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Schema.change_truck(truck)
    end
  end
end
