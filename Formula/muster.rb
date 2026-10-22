class Muster < Formula
  desc "Every machine you own, one AI endpoint (OpenAI/Ollama-compatible router)"
  homepage "https://github.com/nitSubedi/muster"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.1/muster-darwin-arm64"
      sha256 "1b20237bb4d27baf98aec2f1815518ad117bf3b74142272e78e7717b579d0a66"
    end
    on_intel do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.1/muster-darwin-amd64"
      sha256 "48472f0291ee495fb71d59db6e359da693b7fe9c20e6b0e69f44db69b15fd5bb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.1/muster-linux-arm64"
      sha256 "977187e4db071986b1a16fff488a45846a90217b3936feb880428ab61a6aee3e"
    end
    on_intel do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.1/muster-linux-amd64"
      sha256 "c472c032a3e56da27bf2b2d7cbb9270e75888497e97faf48b299e3b5bf2586b1"
    end
  end

  def install
    bin.install Dir["muster-*"].first => "muster"
  end

  def caveats
    <<~EOS
      Start Muster at login with:
        muster service install
      (Not brew services: muster manages its own per-user service.)
    EOS
  end

  test do
    assert_match "muster", shell_output("#{bin}/muster version")
  end
end
