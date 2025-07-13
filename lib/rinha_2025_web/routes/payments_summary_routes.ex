defmodule Rinha2025Web.Routes.PaymentSummaryRoutes do
  use Rinha2025Web, :router
  use Rinha2025Web.Routes.Pipelines.ApiPipeline

  scope "/" do
    pipe_through :api
    resources "/", Rinha2025Web.Controllers.PaymentsSummaryController, only: [:index]
  end
end
