defprotocol Bencode.Encoder do
  def encode(value)
end

defimpl Bencode.Encoder, for: BitString do
  def encode(string) when is_binary(string) do
    [string |> byte_size |> Integer.to_string, ":", string]
  end

  def encode(string) do
    raise Protocol.UndefinedError,
      protocol: @protocol,
      value: string,
      description: "cannot bencode bitstrings"
  end
end

defimpl Bencode.Encoder, for: Integer do
  def encode(integer) do
    ["i", integer |> Integer.to_string, "e"]
  end
end

defimpl Bencode.Encoder, for: List do
  def encode(list) do
    ["l", list |> Enum.map(&Bencode.encode/1), "e"]
  end
end
