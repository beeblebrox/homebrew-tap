# typed: false
# frozen_string_literal: true

class BattlestreamSource < Formula
  desc "Hearthstone Battlegrounds stat tracker (built from source)"
  homepage "https://github.com/beeblebrox/battlestream"
  url "https://github.com/beeblebrox/battlestream/archive/refs/tags/v0.18.0-beta.tar.gz"
  sha256 "40b80acf775b5a972158e4f77047cbf0e94416997c6835f2eaeaab564853bf2e"
  version "0.18.0-beta"
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
