class RatchJob < Formula
  desc "分布式任务调度平台，兼容 xxl-job 协议"
  homepage "https://github.com/ratch-job/ratch-job"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.1.5/ratchjob-aarch64-apple-darwin-v0.1.5.tar.gz"
      sha256 "8f858a1073f09c0dbe60aa3eeb86cdfe13468ce214d726a57a12d2dc96abe9cf"
    else
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.1.5/ratchjob-x86_64-apple-darwin-v0.1.5.tar.gz"
      sha256 "4a975b295be6aef907a9d7014a7890b80c8868616583110776b02d12a90bb1fe"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.1.5/ratchjob-aarch64-unknown-linux-musl-v0.1.5.tar.gz"
      sha256 "a499604cefaf8cc58a74704064c0d2aeca5f0dc002a04bab1a53c83848831b19"
    else
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.1.5/ratchjob-x86_64-unknown-linux-musl-v0.1.5.tar.gz"
      sha256 "9340b46cea21ccf0817d72c156eddd973360849ff76df7b7786df41f6eba0cde"
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
