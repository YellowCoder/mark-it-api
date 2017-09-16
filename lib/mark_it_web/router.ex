defmodule MarkItWeb.Router do
  use MarkItWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MarkItWeb do
    pipe_through :api
  end
end
