defmodule Bencode.EncodeTest do
  use ExSpec, async: true

  defp encode!(value) do
    value |> Bencode.encode
          |> IO.iodata_to_binary
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
      assert_raise Protocol.UndefinedError, ~r/bitstrings/, fn ->
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
    test "empty" do
      assert encode!([]) == "le"
    end

    test "nested" do
      assert encode!([[]]) == "llee"
    end

    test "normal" do
      assert encode!([1, [2, 3], 4]) == "li1eli2ei3eei4ee"
    end
  end

  describe "maps" do
    test "non-string keys" do
      assert_raise Protocol.UndefinedError, ~r/must be binaries/, fn ->
        encode!(%{1 => "hello"})
      end
    end

    test "unordered keys" do
      assert encode!(%{"b" => 2, "a" => 1}) == "d1:ai1e1:bi2ee"
    end
  end
end
