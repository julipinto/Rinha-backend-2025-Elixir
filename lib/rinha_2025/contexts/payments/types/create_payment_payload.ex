defmodule Rinha2025.Contexts.Payments.Types.CreatePaymentPayload do
  @moduledoc """
  Represents the payload for creating a payment.
  """

  use Goal

  alias Rinha2025.Utils.Validations.ParamsValidations
  alias Rinha2025.Utils.Transforms.AmountTransform

  defstruct [:correlation_id, :amount_in_cents]

  defparams :create_params do
    required(:correlationId, :string, format: :uuid)
    required(:amount, :float, minimum: 0.01)
  end

  def create(params) do
    case validate(:create_params, params) do
      {:ok, validated_params} -> {:ok, convert(validated_params)}
      error -> ParamsValidations.traverse_errors(error)
    end
  end

  defp convert(params) do
    %__MODULE__{
      correlation_id: params[:correlationId],
      amount_in_cents: AmountTransform.float_to_cents(params[:amount])
    }
  end
end
