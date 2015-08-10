defprotocol Bencode.Encoder do
  def encode(value, options)
end

defimpl Bencode.Encoder, for: BitString do
  def encode(string, _options) when is_binary(string) do
    [string |> byte_size |> Integer.to_string, ":", string]
  end

  def encode(string, _options) do
    raise Protocol.UndefinedError,
      protocol: @protocol,
      value: string,
      description: "cannot bencode bitstrings"
  end
end
