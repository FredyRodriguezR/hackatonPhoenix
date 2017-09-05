defmodule ParticipathonPruebaWeb.PageController do
  use ParticipathonPruebaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
