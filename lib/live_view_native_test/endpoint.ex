defmodule LiveViewNativeTest.Endpoint do
  @otp_app Application.compile_env!(:live_view_native_test_endpoint, :otp_app)
  @formats Application.compile_env!(:live_view_native_test_endpoint, :formats)

  use Phoenix.Endpoint, otp_app: @otp_app

  socket "/live", Phoenix.LiveView.Socket
  @parsers Plug.Parsers.init(
    parsers: [:urlencoded, :multipart],
    pass: ["*/*"]
  )
  defoverridable url: 0, script_name: 0, config: 1, config: 2, static_path: 1
  def url(), do: "http://localhost:4000"
  def script_name(), do: []
  def static_path(path), do: "/static" <> path
  def config(:live_view), do: [signing_salt: "112345678212345678312345678412"]
  def config(:secret_key_base), do: String.duplicate("57689", 50)
  def config(:cache_static_manifest_latest), do: Process.get(:cache_static_manifest_latest)
  def config(:otp_app), do: @otp_app
  def config(:pubsub_server), do: Phoenix.LiveView.PubSub
  def config(:render_errors), do: [view: __MODULE__, accepts: @formats]
  def config(:static_url), do: [path: "/static"]
  def config(:live_reload), do: [patterns: [~r//]]

  def config(which), do: super(which)
  def config(which, default), do: super(which, default)

  def call(conn, _) do
    %{conn | secret_key_base: config(:secret_key_base)}
    |> Plug.Parsers.call(@parsers)
    |> Plug.Conn.put_private(:phoenix_endpoint, __MODULE__)
    |> LiveViewNativeTest.Router.call([])
  end

  def render(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
