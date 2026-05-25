# typed: false
# frozen_string_literal: true

class BattlestreamSource < Formula
  desc "Hearthstone Battlegrounds stat tracker (built from source)"
  homepage "https://github.com/beeblebrox/battlestream"
  url "https://github.com/beeblebrox/battlestream/archive/refs/tags/v0.23.0-beta.tar.gz"
  sha256 "418fc6e874157b352af114f1673b0e25e1f92ad5863a55cf5c1f4c800b1a13f9"
  version "0.23.0-beta"
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
