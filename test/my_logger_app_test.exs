defmodule MyLoggerAppTest do
  use ExUnit.Case
  doctest MyLoggerApp

  test "greets the world" do
    assert MyLoggerApp.hello() == :world
  end
end
