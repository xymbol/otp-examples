defmodule Calculator do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def push(server, value) do
    GenServer.cast(server, {:push, value})
  end

  def pop(server), do: GenServer.cast(server, :pop)

  def add(server), do: GenServer.cast(server, :add)

  def sub(server), do: GenServer.cast(server, :sub)

  def result(server), do: GenServer.call(server, :result)

  def handle_cast({:push, value}, stack) do
    {:noreply, [value | stack]}
  end

  def handle_cast(:pop, [_ | stack]), do: {:noreply, stack}

  def handle_cast(:add, [a, b | stack]), do: {:noreply, [a + b | stack]}

  def handle_cast(:sub, [a, b | stack]), do: {:noreply, [a - b | stack]}

  def handle_cast(_, stack), do: {:noreply, stack}

  def handle_call(:result, _from, []), do: {:reply, 0, []}

  def handle_call(:result, _from, stack), do: {:reply, hd(stack), stack}
end
