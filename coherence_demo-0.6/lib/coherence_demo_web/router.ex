defmodule CoherenceDemoWeb.Router do
  use CoherenceDemoWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug :put_layout, {CoherenceDemoWeb.ZzView, :zz}
    plug(Coherence.Authentication.Session)
  end

  pipeline :protected do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug :put_layout, {CoherenceDemoWeb.ZzView, :zz}
    # Add this
    plug(Coherence.Authentication.Session, protected: true)
  end

  # Add this block
  scope "/" do
    # scope "/Members" do
    pipe_through([:browser])
    coherence_routes()
  end

  # Add this block
  scope "/" do
    # scope "/Members" do
    pipe_through [:protected]
    coherence_routes(:protected)
  end

  scope "/", CoherenceDemoWeb do
    # scope "/Members", CoherenceDemoWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/", CoherenceDemoWeb do
    # scope "/Members", CoherenceDemoWeb do
    # Use the default browser stack
    pipe_through([:protected])

    resources("/posts", PostController)
    resources("/users", UserController)
    put("/lock/:id", UserController, :lock)
    put("/unlock/:id", UserController, :unlock)
    put("/confirm/:id", UserController, :confirm)
  end

end
