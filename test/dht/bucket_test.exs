defmodule DHT.BucketTest do
  use ExUnit.Case, async: true

  test "default - contains the lowest possible ID" do
    bucket = %DHT.Bucket{}
    assert DHT.Bucket.cover?(bucket, 0) == true
  end

  test "default - contains the highest possible ID" do
    bucket = %DHT.Bucket{}
    assert DHT.Bucket.cover?(bucket, DHT.ID.max) == true
  end

  test "default - does not contain higher IDs" do
    bucket = %DHT.Bucket{}
    assert DHT.Bucket.cover?(bucket, DHT.ID.max + 1) == false
  end
end