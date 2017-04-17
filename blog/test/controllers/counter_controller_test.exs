defmodule Blog.CounterControllerTest do
  use Blog.ConnCase

  test "shows resource", %{conn: conn} do
    conn = get conn, "/counter"
    assert html_response(conn, 200) =~ "Show counter"
  end
end
