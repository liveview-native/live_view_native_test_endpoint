defmodule LiveViewNativeTest.Router do
  use Phoenix.Router
  import Phoenix.LiveView.Router

  pipeline :setup_session do
    plug Plug.Session,
      store: :cookie,
      key: "_live_view_key",
      signing_salt: "/VEDsdfsffMnp5"

    plug :fetch_session
  end


  pipeline :browser do
    formats =
      Application.compile_env!(:live_view_native_test_endpoint, :formats)
      |> Enum.map(&Atom.to_string(&1))

    plug :setup_session
    plug :accepts, formats
    plug :fetch_live_flash
  end


  scope "/" do
    pipe_through [:browser]

    routes = Application.compile_env!(:live_view_native_test_endpoint, :routes)

    for route <- routes do
      live route.path, route.module
    end
  end
end
