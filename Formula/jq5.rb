class Jq5 < Formula
  desc "An extension of jq to work on JSON5 files, preserving comments"
  homepage "https://github.com/vagusX/jq5"
  version "0.4.2"
  license "MIT"

  depends_on "jq"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vagusX/jq5/releases/download/v#{version}/jq5-darwin-aarch64.tar.gz"
      sha256 "3e4b81917d36de218bff6b629e68ef72be4ffe373a38fb51a74280eb2c6de7b5"
    else
      url "https://github.com/vagusX/jq5/releases/download/v#{version}/jq5-darwin-x86_64.tar.gz"
      sha256 "405755ac7b626798128f6f80b57e84b54c691e7afa590f8344df51470cdcc8f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vagusX/jq5/releases/download/v#{version}/jq5-linux-aarch64.tar.gz"
      sha256 "6e6090ea52e3a798bcf57fda332dc07a02c1eeca352c2290afd01fcdbd476d84"
    else
      url "https://github.com/vagusX/jq5/releases/download/v#{version}/jq5-linux-x86_64.tar.gz"
      sha256 "3eec05684807cf790d057112a0bb0c7e968aadcc2044014fdb89efa590ea3051"
    end
  end

  def install
    bin.install "jq5"
  end

  test do
    output = shell_output("echo '{\"name\": \"test\"}' | #{bin}/jq5 '.'")
    assert_match "\"name\": \"test\"", output
  end
end
