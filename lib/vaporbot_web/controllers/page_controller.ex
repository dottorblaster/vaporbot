defmodule VaporbotWeb.PageController do
  use VaporbotWeb, :controller

  def index(conn, _params) do
    conn |> send_resp(200, "OK")
  end

  def vaporfont(conn, _params) do
    %{"payload" => payload} = conn.params
    conn |> send_resp(200, Poison.encode!(
      %{
        message: Vaporstring.parse(payload)
      }
    ))
  end

  def webhook(conn, _params) do
    %{"inline_query" => inline_query} = conn.params
    %{"id" => id, "query" => query} = inline_query
    vaporizedText = Vaporstring.parse(query)

    Nadia.answer_inline_query(id, [%{
      %Nadia.Model.InlineQueryResult.Article{}
      | title: vaporizedText,
      id: "1",
      description: vaporizedText,
      input_message_content: %{ message_text: vaporizedText }
    }])

    conn |> send_resp(200, Poison.encode!(%{status: true}))
  end
end
