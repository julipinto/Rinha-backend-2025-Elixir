defmodule Rinha2025.Integrations.Processor.HttpProcessor do
  @moduledoc """
  HTTP Processor for handling payment requests in the Rinha 2025 application.
  """
  alias Rinha2025.Integrations.Processor.Config

  def health_check(processor) do
    processor
    |> Config.health_check_route()
    |> Config.client()
    |> Tesla.get()
    |> case do
      {:ok, %Tesla.Env{status: 200}, body} ->
        {:ok, body}

      {:ok, %Tesla.Env{status: status}} ->
        {:error, "Health check failed with status #{status}"}

      {:error, reason} ->
        {:error, "Health check failed: #{reason}"}
      end
  end

  def process_payment(processor, payment_payload) do
    processor
    |> Config.payment_route()
    |> Config.client()
    |> Tesla.post(payment_payload)
    |> case do
      {:ok, %Tesla.Env{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %Tesla.Env{status: status}} ->
        {:error, "Payment processing failed with status #{status}"}

      {:error, reason} ->
        {:error, "Payment processing failed: #{reason}"}
    end
  end

  def purge(processor) do
    processor
    |> Config.purge_route()
    |> Config.client()
    |> Tesla.post()
    |> case do
      {:ok, %Tesla.Env{status: 204}} ->
        :ok

      {:ok, %Tesla.Env{status: status}} ->
        {:error, "Purge failed with status #{status}"}

      {:error, reason} ->
        {:error, "Purge failed: #{reason}"}
    end
  end
end