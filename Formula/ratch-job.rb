class RatchJob < Formula
  desc "分布式任务调度平台，兼容 xxl-job 协议"
  homepage "https://github.com/ratch-job/ratch-job"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.2.2/ratchjob-aarch64-apple-darwin-v0.2.2.tar.gz"
      sha256 "17bbedb22dd69c0cfaba3bfd389a49acc00ecaac97f82c5e53fcf84860047112"
    else
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.2.2/ratchjob-x86_64-apple-darwin-v0.2.2.tar.gz"
      sha256 "658fb12772f39608ba3e5b49c5ad0f5f9ac262f45bc747807dba5e0649ef6a87"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.2.2/ratchjob-aarch64-unknown-linux-musl-v0.2.2.tar.gz"
      sha256 "877670bbce3b7fbc51802b97e4cbf5cbabd32985133f5eb02cce5aeb4223b923"
    else
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.2.2/ratchjob-x86_64-unknown-linux-musl-v0.2.2.tar.gz"
      sha256 "152e8535efc71d2041948ae67b23b0260d63a2c9f6604b2ec16b7b4b2f5cb1f8"
    end
  end

  service do
    run [opt_bin/"ratchjob"]
    run_at_load true
    keep_alive true
    log_path var/"log/ratchjob.log"
    error_log_path var/"log/ratchjob.log"
    working_dir var/"lib/ratchjob"
  end

  def install
    bin.install "ratchjob"
  end

  test do
    system "#{bin}/ratchjob", "--version"
  end
end
