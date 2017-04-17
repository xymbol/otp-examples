defmodule TickTest do
  use ExUnit.Case

  test "can start a server" do
    {:ok, pid} = Tick.start_link("+")
    assert is_pid(pid)
  end

  test "can start another server" do
    {:ok, pid} = Tick.start_link("-")
    assert is_pid(pid)
  end

  test "nothing" do
    Process.sleep(1000)
  end
end
