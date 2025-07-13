defmodule Rinha2025Web.Routes.Pipelines.ApiPipeline do
  use Rinha2025Web, :router

  defmacro __using__(_opts) do
    quote do
      pipeline :api do
        plug CORSPlug
        plug :accepts, ["json"]
      end
    end
  end
end
