defmodule Rinha2025.Data.Repositories.PaymentsSummary do
  @moduledoc """
  Repository for managing Payment Summary entities in the Rinha 2025 application.
  """

  alias Rinha2025.Data.Schemas.Payment
  alias Rinha2025.Repo
  import Ecto.Query

  @doc """
  Fetches all payments within a specified date range.
  """
  def get_payments(%{start_date: nil, end_date: nil}), do: Repo.all(Payment)

  def get_payments(%{start_date: start_date, end_date: nil}) do
    Payment
    |> where([p], p.requested_at >= ^start_date)
    |> Repo.all()
  end

  def get_payments(%{start_date: nil, end_date: end_date}) do
    Payment
    |> where([p], p.requested_at <= ^end_date)
    |> Repo.all()
  end

  def get_payments(%{start_date: start_date, end_date: end_date}) do
    Payment
    |> where([p], p.requested_at >= ^start_date and p.requested_at <= ^end_date)
    |> Repo.all()
  end

  # @doc """
  # Calculates the total amount_in_cents of payments within a specified date range.
  # """
  def get_total_payments(filters) do
    filters
    |> get_payments()
    |> Enum.reduce(0, fn payment, acc -> acc + payment.amount_in_cents end)
  end
end
