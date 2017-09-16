defmodule MarkIt.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias MarkIt.Accounts.User


  schema "users" do
    field :crypted_password, :string
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :crypted_password])
    |> validate_required([:name, :email, :crypted_password])
    |> unique_constraint(:email)
  end
end
