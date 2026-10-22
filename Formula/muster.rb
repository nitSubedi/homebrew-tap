class Muster < Formula
  desc "Every machine you own, one AI endpoint (OpenAI/Ollama-compatible router)"
  homepage "https://github.com/nitSubedi/muster"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.2/muster-darwin-arm64"
      sha256 "d6c1f5ef3e43e560f1cad094ce9885b062ef1a7d382999a6dcaa790ea2779692"
    end
    on_intel do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.2/muster-darwin-amd64"
      sha256 "02b25078dcf54faa18d0f8813eae0fc877e88306bed40ca2299aa5e8e5b649b1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.2/muster-linux-arm64"
      sha256 "7447d1f5ad3a7bdb932fd89988db7263afd9680b24ac11d5a4785d260268a9f1"
    end
    on_intel do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.2/muster-linux-amd64"
      sha256 "cfe3cd1dc89eabc1f6e9b73c85c18f446b57c1115f7f4fa4eecbb9a6231f3e98"
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
