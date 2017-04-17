defmodule AdderTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Adder.start_link()
    {:ok, pid: pid}
  end

  test "starts server", %{pid: pid} do
    assert is_pid(pid)
  end

  test "adds amount", %{pid: pid} do
    assert Adder.add(pid, 1) == :ok
  end

  test "returns total", %{pid: pid} do
    Adder.add(pid, 2) # <== cast
    Adder.add(pid, 3) # <== cast
    assert Adder.total(pid) == 5 # <== call, okay
  end
end
