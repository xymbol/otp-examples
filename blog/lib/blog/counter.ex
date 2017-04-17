defmodule Blog.Counter do
  use GenServer

  @default_name __MODULE__
  @default_options [name: @default_name]

  def start_link(initial_counter, options \\ @default_options) do
    GenServer.start_link(__MODULE__, initial_counter, options)
  end

  def read(server \\ @default_name) do
    GenServer.call(server, :read)
  end

  def handle_call(:read, _from, counter) do
    {:reply, counter, counter + 1}
  end
end
