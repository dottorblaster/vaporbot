defmodule VaporbotWeb.PageControllerTest do
  use VaporbotWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert response(conn, 200) =~ "OK"
  end
end
