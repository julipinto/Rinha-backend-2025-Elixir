defmodule Rinha2025Web.ErrorJSONTest do
  use Rinha2025Web.ConnCase, async: true

  test "renders 404" do
    assert Rinha2025Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Rinha2025Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
