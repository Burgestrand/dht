defprotocol Bencode.Encoder do
  def encode(value, options)
end
