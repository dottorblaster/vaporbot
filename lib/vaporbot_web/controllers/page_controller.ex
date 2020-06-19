defmodule VaporbotWeb.PageController do
  use VaporbotWeb, :controller

  def index(conn, _params) do
    conn |> send_resp(200, "OK")
  end

  def vaporfont(conn, _params) do
    %{"payload" => payload} = conn.params

    conn
    |> send_resp(
      200,
      Jason.encode!(%{
        message: Vaporstring.parse(payload)
      })
    )
  end

  def webhook(conn, _params) do
    case conn.params do
      %{"inline_query" => inline_query} ->
        %{"id" => id, "query" => query} = inline_query
        vaporizedText = Vaporstring.parse(query)

        Nadia.answer_inline_query(id, [
          %{
            %Nadia.Model.InlineQueryResult.Article{}
            | title: vaporizedText,
              id: "1",
              description: vaporizedText,
              input_message_content: %{message_text: vaporizedText}
          }
        ])

        conn |> send_resp(200, Jason.encode!(%{status: true}))

      _ ->
        conn |> send_resp(200, Jason.encode!(%{status: true}))
    end
  end
end
