defmodule LiveViewNativeTest do
  defmacro native(conn, path, format, interface \\ {:%{}, [], []}) do
    quote do
      unquote(conn)
      |> put_connect_params(LiveViewNativeTest.build_connect_params(unquote(format), unquote(interface)))
      |> live(LiveViewNativeTest.build_uri(unquote(path), unquote(format), unquote(interface)))
    end
  end

  def build_connect_params(format, interface) do
    %{
      "_format" => Atom.to_string(format),
      "_interface" => interface
    }
  end

  def build_uri(path, format, interface) do
    params = build_connect_params(format, interface)

    query = Plug.Conn.Query.encode(params)

    %URI{
      path: path,
      query: query
    }
    |> URI.to_string()
  end
end
