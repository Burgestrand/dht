defmodule Bencode.EncodeTest do
  use ExSpec, async: true

  defp encode!(value) do
    {:ok, iodata} = Bencode.encode(value)
    IO.iodata_to_binary(iodata)
  end

  describe "byte strings" do
    test "zero length" do
      assert encode!("") == "0:"
    end

    test "arbitrary length" do
      assert encode!("hello world") == "11:hello world"
    end

    test "with NULL byte in it" do
      assert encode!("\x00") == "1:\x00"
    end

    test "with bitstring" do
      assert_raise Protocol.UndefinedError, fn ->
        encode!(<< 0 :: size(1) >>)
      end
    end
  end

  describe "integers" do
    test "zero" do
      assert encode!(0) == "i0e"
    end

    test "positive" do
      assert encode!(101) == "i101e"
    end

    test "negative" do
      assert encode!(-15) == "i-15e"
    end
  end

  describe "lists" do
  end

  describe "dictionaries" do
  end
end
