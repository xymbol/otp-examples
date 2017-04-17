defmodule Tick do
  use GenServer

  def start_link(mark) do
    GenServer.start_link(__MODULE__, mark)
  end

  def init(mark) do
    update_tick(mark)
    {:ok, mark}
  end

  def handle_info(:tick, mark) do
    update_tick(mark)
    {:noreply, mark}
  end

  @update_time 100

  defp update_tick(mark) do
    IO.write(mark)
    Process.send_after(self(), :tick, @update_time)
  end
end
