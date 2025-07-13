defmodule Rinha2025.Repo.Migrations.CreateTablePayments do
  use Ecto.Migration

  def up do
    create table(:payments) do
      add :correlation_id, :string, null: false
      add :amount_in_cents, :integer, null: false
      add :requested_at, :utc_datetime, default: fragment("now()"), null: false
      add :processed_at, :utc_datetime, default: nil
      add :processed_by, :string, default: nil

      timestamps()
    end

    create unique_index(:payments, [:correlation_id])
  end

  def down, do: nil
end
