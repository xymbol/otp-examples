defmodule CounterTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Counter.start_link()
    {:ok, pid: pid}
  end

  test "starts a server", %{pid: pid} do
    assert is_pid(pid)
  end

  test "returns 1 on first read", %{pid: pid} do
    assert Counter.read(pid) == 1
  end

  test "returns 3 on third read", %{pid: pid} do
    Counter.read(pid)
    Counter.read(pid)
    assert Counter.read(pid) == 3
  end

  test "sets initial count" do
    {:ok, pid} = Counter.start_link(123)
    assert Counter.read(pid) == 123
  end
end
