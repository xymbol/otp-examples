defmodule CalculatorTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Calculator.start_link()
    {:ok, pid: pid}
  end

  test "starts a calculator", %{pid: pid} do
    assert is_pid(pid)
  end

  test "pushes a value", %{pid: pid} do
    Calculator.push(pid, 1)
    assert Calculator.result(pid) == 1
  end

  test "pops a value", %{pid: pid} do
    Calculator.push(pid, 1)
    Calculator.push(pid, 2)
    Calculator.pop(pid)
    assert Calculator.result(pid) == 1
  end

  test "adds two values", %{pid: pid} do
    Calculator.push(pid, 2)
    Calculator.push(pid, 3)
    Calculator.add(pid)
    assert Calculator.result(pid) == 5
  end

  test "subtracts two values", %{pid: pid} do
    Calculator.push(pid, 5)
    Calculator.push(pid, 7)
    Calculator.sub(pid)
    assert Calculator.result(pid) == 2
  end

  test "expensive setup" do
    assert {_, [12, 3, 2, 1]} =
      Calculator.handle_cast(:add, [7, 5, 3, 2, 1])
  end
end
