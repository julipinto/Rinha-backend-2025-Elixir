defmodule Rinha2025.Integrations.Processor.Config do

  def add_admin_token() do
  end

  def health_check_route(processor) do
    get_processor_url(processor)
    |> "#{url}/payments/service-health"
  end

  def payment_route(url) do
    get_processor_url(processor)
    |> "#{url}/payments"
  end

  def purge_route(url) do
    get_processor_url(processor)
    |> "#{url}/admin/purge-payments"
  end

  def client(url) do
    Tesla.client([
      {Tesla.Middleware.BaseUrl, url},
      Tesla.Middleware.JSON,
      Tesla.Middleware.Logger
    ])
  end
  
    def get_processor_url(:default) do
    Application.get_env(:rinha_2025, :processor_url, "http://localhost:8001")
  end

  def get_processor_url(:fallback) do
    Application.get_env(:rinha_2025, :fallback_processor_url, "http://localhost:8002")
  end
end