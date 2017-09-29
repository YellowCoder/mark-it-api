defmodule MarkItWeb.PageController do
  use MarkItWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
