defmodule DHT.BucketTest do
  use ExUnit.Case, async: true

  test "default bucket" do
    bucket = %DHT.Bucket{}

    assert DHT.Bucket.cover?(bucket, -1) == false
    assert DHT.Bucket.cover?(bucket, 0) == true
    assert DHT.Bucket.cover?(bucket, DHT.ID.max) == true
    assert DHT.Bucket.cover?(bucket, DHT.ID.max + 1) == false
    assert DHT.Bucket.size(bucket) == 0
  end

  test "#cover?/2" do
    bucket = %DHT.Bucket{range: 2..8}

    assert DHT.Bucket.cover?(bucket, 1) == false
    assert DHT.Bucket.cover?(bucket, 2) == true
    assert DHT.Bucket.cover?(bucket, 5) == true
    assert DHT.Bucket.cover?(bucket, 8) == true
    assert DHT.Bucket.cover?(bucket, 9) == false
  end

  test "#add/2 - adding a new entry to an empty bucket" do
    bucket = %DHT.Bucket{range: 2..8}

    assert DHT.Bucket.size(bucket) == 0
    {:ok, bucket} = DHT.Bucket.add(bucket, 4)
    assert DHT.Bucket.size(bucket) == 1
  end

  test "#add/2 - adding a new entry that is not covered by the bucket" do
    bucket = %DHT.Bucket{range: 2..8}

    assert DHT.Bucket.add(bucket, 9) == {:error, "9 is not within 2..8"}
  end

  test "#add/2 - adding an entry that already exists in the bucket" do
    bucket = %DHT.Bucket{range: 2..8}
    {:ok, bucket} = DHT.Bucket.add(bucket, 4)

    assert DHT.Bucket.add(bucket, 4) == {:error, "4 already exists within bucket"}
  end
end
