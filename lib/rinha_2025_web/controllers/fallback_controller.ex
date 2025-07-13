defmodule Rinha2025Web.Controllers.FallbackController do
  @moduledoc """
  Handles fallback responses for the web controllers.
  """

  use Rinha2025Web, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(Rinha2025Web.ErrorJSON)
    |> render("404.json")
  end

  def call(conn, {:error, :bad_request, reason}) do
    conn
    |> put_status(:bad_request)
    |> put_view(Rinha2025Web.ErrorJSON)
    |> render("400.json", reason: reason)
  end

  def call(conn, {:error, :internal_server_error}) do
    conn
    |> put_status(:internal_server_error)
    |> put_view(Rinha2025Web.ErrorJSON)
    |> render("500.json")
  end

  def call(conn, {:error, reason}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(Rinha2025Web.ErrorJSON)
    |> render("422.json", reason: reason)
  end
end
