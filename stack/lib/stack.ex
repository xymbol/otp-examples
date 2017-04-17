defmodule Stack do
  @default_state []

  def start_link(state \\ @default_state) do
    {:ok, spawn_link(__MODULE__, :loop, [state])}
  end

  def push(server, value) do
    cast(server, {:push, value})
  end

  def pop(server) do
    call(server, :pop)
  end

  def loop(state) do
    new_state = receive do
      {term, {client, ref}} ->
        {res, res_state} = handle(term, state)
        send client, {ref, res}
        res_state
      term ->
        handle(term, state)
    end
    loop(new_state)
  end

  def handle({:push, value}, state), do: [value | state]

  def handle(:pop, [value | state]), do: {value, state}

  def handle(:pop, []), do: {nil, []}

  defp cast(server, term) do
    send server, term
    :ok
  end

  defp call(server, term) do
    ref = make_ref()
    send server, {term, {self(), ref}}
    receive do
      {^ref, res} -> res
    end
  end
end
