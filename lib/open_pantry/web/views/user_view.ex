defmodule OpenPantry.Web.UserView do
  use OpenPantry.Web, :view
  alias OpenPantry.Web.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id}
  end

  def facility_list do
    OpenPantry.Facility.all()
    |> Enum.map(&({&1.name, &1.id}))
  end

  def language_list do
    OpenPantry.Language.all()
    |> Enum.map(&({&1.english_name, &1.id}))
  end
end
