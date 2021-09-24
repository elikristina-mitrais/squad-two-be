defmodule Kargohackathon.Shipments do
  @moduledoc """
  The Shipments context.
  """

  import Ecto.Query, warn: false
  alias Kargohackathon.{Repo, PaginationShipment}


  alias Kargohackathon.Shipments.Shipment

  @doc """
  Returns the list of shipments.

  ## Examples

      iex> list_shipments()
      [%Shipment{}, ...]

  """
  def list_shipments do
    Repo.all(Shipment)
    |> Repo.preload([:truck, :driver])
  end

  def list_shipments(a, page \\ 1, per_page \\ 10)

  def list_shipments(:paged, page, per_page) do
    Shipment
    |> order_by(asc: :inserted_at)
    |> PaginationShipment.page(page, per_page: per_page)
  end

  @doc """
  Gets a single shipment.

  Raises `Ecto.NoResultsError` if the Shipment does not exist.

  ## Examples

      iex> get_shipment!(123)
      %Shipment{}

      iex> get_shipment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shipment!(id), do: Repo.get!(Shipment, id)

  @doc """
  Creates a shipment.

  ## Examples

      iex> create_shipment(%{field: value})
      {:ok, %Shipment{}}

      iex> create_shipment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shipment(attrs \\ %{}) do
    %Shipment{}
    |> Shipment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shipment.

  ## Examples

      iex> update_shipment(shipment, %{field: new_value})
      {:ok, %Shipment{}}

      iex> update_shipment(shipment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shipment(%Shipment{} = shipment, attrs) do
    shipment
    |> Shipment.changeset(attrs)
    |> Repo.update()
  end

  def allocate_shipment(%Shipment{} = shipment, attrs) do
    shipment
    |> Shipment.changeset_allocate(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shipment.

  ## Examples

      iex> delete_shipment(shipment)
      {:ok, %Shipment{}}

      iex> delete_shipment(shipment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shipment(%Shipment{} = shipment) do
    Repo.delete(shipment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shipment changes.

  ## Examples

      iex> change_shipment(shipment)
      %Ecto.Changeset{data: %Shipment{}}

  """
  def change_shipment(%Shipment{} = shipment, attrs \\ %{}) do
    Shipment.changeset(shipment, attrs)
  end

  def list_shipment_transporter(a, page \\ 1, per_page \\ 10)

  def list_shipment_transporter(:paged, page, per_page) do
    Shipment
    |> where(assign_to: "transporter")
    |> order_by(asc: :inserted_at)
    |> PaginationShipment.page(page, per_page: per_page)
  end

  def get_shipment_transporter!(id), do: Repo.get_by!(Shipment, assign_to: "transporter")
end
