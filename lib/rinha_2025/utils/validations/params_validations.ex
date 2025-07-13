defmodule Rinha2025.Utils.Validations.ParamsValidations do
  @moduledoc """
  Provides validation functions for parameters.
  """

  def traverse_errors({:error, changeset}) do
    {:error, transverse_errors(changeset)}
  end

  def transverse_errors(changeset) do
    Goal.traverse_errors(changeset, fn {msg, opts} ->
      Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
