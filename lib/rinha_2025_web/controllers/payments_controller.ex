defmodule Rinha2025Web.Controllers.PaymentsController do
  use Rinha2025Web, :controller

  alias Rinha2025.Contexts.Payments.Types.CreatePaymentPayload
  alias Rinha2025.Contexts.PaymentsContext

  action_fallback Rinha2025Web.Controllers.FallbackController

  def create(conn, params) do
    with {:ok, params} <- CreatePaymentPayload.create(params),
         {:ok, payment} <- PaymentsContext.create_payment(params) |> IO.inspect() do
      conn
      |> put_status(:created)
      |> json(payment)
    end
  end
end
