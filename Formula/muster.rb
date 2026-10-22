class Muster < Formula
  desc "Every machine you own, one AI endpoint (OpenAI/Ollama-compatible router)"
  homepage "https://github.com/nitSubedi/muster"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.3/muster-darwin-arm64"
      sha256 "747014496de888226e2a2d3bf41f0cee7ce503a2f762abdab516528dcba8bea9"
    end
    on_intel do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.3/muster-darwin-amd64"
      sha256 "6e184c08326f40c818652df63b754a8872205d60876b09180b1e1d625cf06bd5"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.3/muster-linux-arm64"
      sha256 "356a43a790e3ff242616a58f98bb23d5751d9305c0f28e3e316db52188a835bd"
    end
    on_intel do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.3/muster-linux-amd64"
      sha256 "74f2fb4571705c9ae5c3382ad35091f6835306ea01105c57080722afb77e57d8"
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
