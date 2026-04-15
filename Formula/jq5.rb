class Jq5 < Formula
  desc "An extension of jq to work on JSON5 files, preserving comments"
  homepage "https://github.com/vagusX/jq5"
  version "0.4.1"
  license "MIT"

  depends_on "jq"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vagusX/jq5/releases/download/v#{version}/jq5-darwin-aarch64.tar.gz"
      sha256 "69fc657582a24b9dd4fb39e55554ebc27e670d1933c64f46f8fd03fcd9b905a8"
    else
      url "https://github.com/vagusX/jq5/releases/download/v#{version}/jq5-darwin-x86_64.tar.gz"
      sha256 "4766a1e5bbb9f04a83d03bf31087240ba740392e703ad20ee054ce4abbe0a72e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vagusX/jq5/releases/download/v#{version}/jq5-linux-aarch64.tar.gz"
      sha256 "5b00e944822edc9b5130b0e94535dc9607e1e54afd9315871822e653c6dcfc39"
    else
      url "https://github.com/vagusX/jq5/releases/download/v#{version}/jq5-linux-x86_64.tar.gz"
      sha256 "1646df2562b60c5a840533225a59980af3bee6082047517585e6ce615094c703"
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
