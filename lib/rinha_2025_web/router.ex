defmodule Rinha2025Web.Router do
  use Rinha2025Web, :router
  use Rinha2025Web.Routes.Default

  alias Rinha2025Web.Routes.PaymentRoutes
  alias Rinha2025Web.Routes.PaymentSummaryRoutes

  forward "/payments", PaymentRoutes

  forward "/payments-summary", PaymentSummaryRoutes
end
