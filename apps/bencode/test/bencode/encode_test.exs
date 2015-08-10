defmodule Bencode.EncodeTest do
  use ExSpec, async: true

  defp encode!(value) do
    {:ok, iodata} = Bencode.encode(value)
    IO.iodata_to_binary(iodata)
  end

  describe "byte strings" do
  end

  describe "integers" do
  end

  describe "lists" do
  end

  describe "dictionaries" do
  end
end
