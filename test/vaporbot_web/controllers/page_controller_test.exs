defmodule VaporbotWeb.PageControllerTest do
  use VaporbotWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert response(conn, 200) =~ "OK"
  end

  test "POST /vaporfont", %{conn: conn} do
    conn = post conn, "/vaporfont", [payload: "topkek this is a test"]
    %{"message" => message} = Jason.decode! response(conn, 200)
    assert message === "ｔｏｐｋｅｋ　ｔｈｉｓ　ｉｓ　ａ　ｔｅｓｔ"
  end
end
