defmodule Writer do
  use GenServer

  def start_link(path) do
    GenServer.start_link(__MODULE__, path)
  end

  def init(path) do
    :ok = remove_if_exists(path)
    {:ok, path}
  end

  def write(server, content) do
    GenServer.cast(server, {:write, content})
  end

  def read(server) do
    GenServer.call(server, :read)
  end

  def wait(server) do
    GenServer.call(server, :wait)
  end

  def handle_cast({:write, content}, path) do
    :ok = File.write(path, content, [:write])
    {:noreply, path}
  end

  def handle_call(:read, _from, path) do
    {:reply, File.read(path), path}
  end

  def handle_call(:wait, _from, path) do
    {:reply, :ok, path}
  end

  defp remove_if_exists(path) do
    case File.rm(path) do
      :ok -> :ok
      {:error, :enoent} -> :ok
      _ -> :error
    end
  end
end
