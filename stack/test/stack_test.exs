defmodule StackTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Stack.start_link()
    {:ok, pid: pid}
  end

  test "starts a stack", %{pid: pid} do
    assert is_pid(pid)
  end

  test "pushes to stack", %{pid: pid} do
    assert Stack.push(pid, 1) == :ok
  end

  test "pops from stack", %{pid: pid} do
    assert Stack.pop(pid) == nil
  end

  test "pushes then pops", %{pid: pid} do
    Stack.push(pid, 5)
    assert Stack.pop(pid) == 5
  end

  test "pushes multiple times", %{pid: pid} do
    Stack.push(pid, 5)
    Stack.push(pid, 7)
    assert Stack.pop(pid) == 7
  end

  test "pops multiple times", %{pid: pid} do
    Stack.push(pid, 5)
    assert Stack.pop(pid) == 5
    assert Stack.pop(pid) == nil
  end
end
