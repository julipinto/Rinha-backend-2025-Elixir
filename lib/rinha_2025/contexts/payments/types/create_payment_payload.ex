defmodule Rinha2025.Contexts.Payments.Types.CreatePaymentPayload do
  @moduledoc """
  Represents the payload for creating a payment.
  """

  use Goal

  import Rinha2025.Utils.Validations.ParamsValidations, only: [traverse_errors: 1]

  defstruct [:correlation_id, :amount]

  defparams :create_params do
    required(:correlationId, :string, format: :uuid)
    required(:amount, :float, minimum: 0.01)
  end

  def create(params) do
    case validate(:create_params, params) do
      {:ok, validated_params} -> {:ok, convert(validated_params)}
      error -> traverse_errors(error)
    end
  end

  defp convert(params) do
    %__MODULE__{
      correlation_id: Map.get(params, :correlationId),
      amount: Map.get(params, :amount)
    }
  end
end
