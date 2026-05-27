# typed: false
# frozen_string_literal: true

class BattlestreamSource < Formula
  desc "Hearthstone Battlegrounds stat tracker (built from source)"
  homepage "https://github.com/beeblebrox/battlestream"
  url "https://github.com/beeblebrox/battlestream/archive/refs/tags/v0.24.0-beta.tar.gz"
  sha256 "4a61ad3d71bc17c970a8ad970478f1fcb0cf5f92381b4fb2f1a2c80ffcdfd91e"
  version "0.24.0-beta"
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
