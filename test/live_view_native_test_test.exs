defmodule LiveViewNativeTestTest do
  use ExUnit.Case
  doctest LiveViewNativeTest

  test "greets the world" do
    assert LiveViewNativeTest.hello() == :world
  end
end
