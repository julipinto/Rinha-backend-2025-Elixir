defmodule Rinha2025.Contexts.PaymentsContext do
  @moduledoc """
  Context for handling payments in the Rinha 2025 application.
  """
  alias Rinha2025.Contexts.Payments.Types.CreatePaymentPayload
  alias Rinha2025.Data.Repositories.PaymentsRepository

  def create_payment(%CreatePaymentPayload{} = params) do
    with {:ok, payment} <- PaymentsRepository.create_payment(params) do
      {:ok, payment}
    end
  end
end
