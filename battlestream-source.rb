# typed: false
# frozen_string_literal: true

class BattlestreamSource < Formula
  desc "Hearthstone Battlegrounds stat tracker (built from source)"
  homepage "https://github.com/beeblebrox/battlestream"
  url "https://github.com/beeblebrox/battlestream/archive/refs/tags/v0.25.0-beta.tar.gz"
  sha256 "1ef27eba352ac666fa3dd8a4401d64bc07fd7789c233272538030bb88461468f"
  version "0.25.0-beta"
  license "MIT"

  depends_on "go" => :build

  conflicts_with "battlestream", because: "both install a `battlestream` binary"

  def install
    system "go", "build", *std_go_args(output: bin/"battlestream", ldflags: "-s -w -X main.version=#{version}"), "./cmd/battlestream"
  end

  test do
    system "#{bin}/battlestream", "version"
  end
end
