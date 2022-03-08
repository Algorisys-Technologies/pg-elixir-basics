defmodule ChirpWeb.PostLive.PostComponent do
  use ChirpWeb, :live_component

  def render(assigns) do
    ~H"""
    <div style="border:1px solid darkseagreen;margin:5px;
    padding:5px">
      <div class="row">
        <div class="column column-10">
        <span style="color:red;font-size:50px">&#128511;</span>
        </div>
        <div class="column column-90 post-body">
          <b>@<%= @post.username %></b>
          <br/>
          <%= @post.body %>
        </div>
      </div>

      <div class="row">
        <div class="column column-10">
         <a href="#" phx-click="like" phx-target={@myself}>
          <span style="color:red;font-size:large"> &#10084;</span> <%= @post.likes_count %>
         </a>
        </div>
        <div class="column column-10">
          <a href="#" phx-click="repost" phx-target={@myself}>
            &#128257; <%= @post.reposts_count %>
          </a>
        </div>
        <div class="column">
          <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
            <span style="font-size:20px">&#9999;</span>
          <% end %>
          <%= link to: "#", phx_click: "delete", phx_value_id: @post.id, data: [confirm: "Are you sure?"] do %>
            &#10060;
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  def handle_event("like", _, socket) do
    Chirp.Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
  end

  def handle_event("repost", _, socket) do
    Chirp.Timeline.inc_reposts(socket.assigns.post)
    {:noreply, socket}
  end
end
