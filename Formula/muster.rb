class Muster < Formula
  desc "Every machine you own, one AI endpoint (OpenAI/Ollama-compatible router)"
  homepage "https://github.com/nitSubedi/muster"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.0/muster-darwin-arm64"
      sha256 "d2372bfc3b10a5a8f962abae14851ceb10839179a4493e29e6da6d9190f0461e"
    end
    on_intel do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.0/muster-darwin-amd64"
      sha256 "3d9621f5145e331fc697fa59636a1f4213181f323ce9470ebf1411d24982e7c1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.0/muster-linux-arm64"
      sha256 "c3991c21ce8a1b388fd5050c5b9f5a5a3f9fc8dbb6ef384113bbbbe697f327d1"
    end
    on_intel do
      url "https://github.com/nitSubedi/muster/releases/download/v0.2.0/muster-linux-amd64"
      sha256 "3353bb817b59f38b9fafe7f6a4baef09f6ede3419af286ffa8c0ed54089e7227"
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
