# typed: false
# frozen_string_literal: true

class BattlestreamSource < Formula
  desc "Hearthstone Battlegrounds stat tracker (built from source)"
  homepage "https://github.com/beeblebrox/battlestream"
  url "https://github.com/beeblebrox/battlestream/archive/refs/tags/v0.17.1-beta.tar.gz"
  sha256 "186a88afbceb24c3e9a5c4b2b7e01b61c7c15e1b00a17c547004f222d29043f7"
  version "0.17.1-beta"
  license "MIT"

  depends_on "go" => :build

  conflicts_with "battlestream", because: "both install a `battlestream` binary"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/battlestream"
  end

  test do
    system "#{bin}/battlestream", "version"
  end
end
