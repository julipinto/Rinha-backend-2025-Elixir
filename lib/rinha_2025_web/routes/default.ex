defmodule Rinha2025Web.Routes.Default do
  use Rinha2025Web, :router

  defmacro __using__(_opts) do
    quote do
      # Enable LiveDashboard in development
      if Application.compile_env(:rinha_2025, :dev_routes) do
        # If you want to use the LiveDashboard in production, you should put
        # it behind authentication and allow only admins to access it.
        # If your application does not have an admins-only section yet,
        # you can use Plug.BasicAuth to set up some basic authentication
        # as long as you are also using SSL (which you should anyway).
        import Phoenix.LiveDashboard.Router

        scope "/dev" do
          pipe_through [:fetch_session, :protect_from_forgery]

          live_dashboard "/dashboard", metrics: Rinha2025Web.Telemetry
        end
      end
    end
  end
end
