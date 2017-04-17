defmodule Blog.CounterTest do
  use ExUnit.Case

  alias Blog.Counter

  setup do
    {:ok, pid} = Counter.start_link(1, [])
    {:ok, pid: pid}
  end

  test "returns 1 on first read", %{pid: pid} do
    assert Counter.read(pid) == 1
  end
end
