defmodule Blog.CounterController do
  use Blog.Web, :controller

  alias Blog.Counter

  def show(conn, _params) do
    counter = Counter.read()
    render(conn, "show.html", counter: counter)
  end
end
