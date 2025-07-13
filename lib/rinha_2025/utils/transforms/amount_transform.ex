defmodule Rinha2025.Utils.Transforms.AmountTransform do
  @moduledoc """
  Utility module for transforming amounts in payment payloads.
  """

  @doc """
  Converts a float amount to an integer representing cents.
  """
  def float_to_cents(float_amount) when is_float(float_amount) do
    trunc(float_amount * 100)
  end

  @doc """
  Converts an integer amount in cents to a float.
  """
  def cents_to_float(cents_amount) when is_integer(cents_amount) do
    cents_amount / 100.0
  end
end
