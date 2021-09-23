defmodule KargohackathonWeb.PageController do
  use KargohackathonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
