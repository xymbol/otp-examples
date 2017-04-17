defmodule Counter do
  use GenServer

  def start_link(count \\ 1) do
    GenServer.start_link(__MODULE__, count)
  end

  def read(server) do
    GenServer.call(server, :read)
  end

  def handle_call(:read, _from, count) do
    {:reply, count, count + 1}
  end
end
