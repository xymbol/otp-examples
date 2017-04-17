defmodule WriterTest do
  use ExUnit.Case, async: false

  @tmp "/tmp/writer.txt"

  setup do
    {:ok, pid} = Writer.start_link(@tmp)
    {:ok, pid: pid}
  end

  test "starts a server", %{pid: pid} do
    assert is_pid(pid)
  end

  test "writes and file exists", %{pid: pid} do
    Writer.write(pid, "hello")
    Writer.wait(pid)
    assert File.exists?(@tmp)
  end

  test "writes contents to file", %{pid: pid} do
    Writer.write(pid, "hello")
    Writer.wait(pid)
    assert {:ok, "hello"} = File.read(@tmp)
  end

  test "writes multiple times", %{pid: pid} do
    Writer.write(pid, "foo")
    Writer.write(pid, "bar")
    Writer.write(pid, "baz")
    Writer.wait(pid)
    assert {:ok, "baz"} = File.read(@tmp)
  end

  test "writes and reads file", %{pid: pid} do
    Writer.write(pid, "hello")
    assert {:ok, "hello"} = Writer.read(pid)
  end
end
