defmodule DHT.BucketTest do
  use ExUnit.Case, async: true

  test "default bucket" do
    bucket = %DHT.Bucket{}

    assert DHT.Bucket.cover?(bucket, -1) == false
    assert DHT.Bucket.cover?(bucket, 0) == true
    assert DHT.Bucket.cover?(bucket, DHT.ID.max) == true
    assert DHT.Bucket.cover?(bucket, DHT.ID.max + 1) == false
  end

  test "#cover?/2" do
    bucket = %DHT.Bucket{range: 2..8}

    assert DHT.Bucket.cover?(bucket, 1) == false
    assert DHT.Bucket.cover?(bucket, 2) == true
    assert DHT.Bucket.cover?(bucket, 5) == true
    assert DHT.Bucket.cover?(bucket, 8) == true
    assert DHT.Bucket.cover?(bucket, 9) == false
  end
end
