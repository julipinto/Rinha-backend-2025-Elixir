defmodule Rinha2025.Contexts.PaymentsContext do
  @moduledoc """
  Context for handling payments in the Rinha 2025 application.
  """
  alias Rinha2025.Contexts.Payments.Types.CreatePaymentPayload

  def create_payment(%CreatePaymentPayload{} = params) do
    # Here you would typically interact with your payment processing service
    # For demonstration, we will just return the params as a mock payment
    {:ok,
     %{
       id: Ecto.UUID.generate(),
       correlation_id: params.correlation_id,
       amount: params.amount_in_cents
     }}
  end
end
