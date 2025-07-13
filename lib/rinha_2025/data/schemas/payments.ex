defmodule Rinha2025.Data.Schemas.Payment do
  @moduledoc """
  Schema for the Payment entity in the Rinha 2025 application.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @optional_fields [:processed_at, :processed_by]
  @required_fields [:correlation_id, :amount_in_cents, :requested_at]

  schema "payments" do
    field :correlation_id, :string
    field :amount_in_cents, :decimal
    field :requested_at, :utc_datetime, default: DateTime.truncate(DateTime.utc_now(), :second)
    field :processed_at, :utc_datetime, default: nil
    field :processed_by, :string, default: nil

    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_number(:amount_in_cents, greater_than: 0)
    |> unique_constraint(:correlation_id)
  end
end
