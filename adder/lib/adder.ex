defmodule Adder do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, 0)
  end

  def add(server, amount) do
    GenServer.cast(server, {:add, amount})
  end

  def total(server) do
    GenServer.call(server, :total)
  end

  def handle_cast({:add, amount}, total) do
    {:noreply, total + amount}
  end

  def handle_call(:total, _from, total) do
    {:reply, total, total}
  end
end
