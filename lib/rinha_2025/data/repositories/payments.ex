defmodule Rinha2025.Data.Repositories.PaymentsRepository do
  @moduledoc """
  Repository for managing Payment entities in the Rinha 2025 application.
  """

  import Ecto.Query

  alias Rinha2025.Data.Schemas.Payment
  alias Rinha2025.Repo

  @doc """
  Creates a new payment with the given attributes.
  """
  def create_payment(attrs) do
    %Payment{}
    |> Payment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Fetches a payment by its correlation ID.
  """
  def get_payment_by_correlation_id(correlation_id) do
    query_for_correlation_id(correlation_id)
    |> Repo.one()
  end

  @doc """
  Updates an existing payment based on correlation ID.
  """
  def update_payment(correlation_id, attrs) do
    payment = get_payment_by_correlation_id(correlation_id)

    payment
    |> Payment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Query for correlation ID.
  """
  def query_for_correlation_id(correlation_id) do
    Payment
    |> where(correlation_id: ^correlation_id)
  end
end
