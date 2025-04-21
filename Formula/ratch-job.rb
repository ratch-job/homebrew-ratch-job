# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class RatchJob < Formula
  desc "ratch-job"
  homepage "https://github.com/ratch-job/ratch-job"
  url "https://github.com/ratch-job/ratch-job/releases/download/v0.1.5/ratchjob-x86_64-apple-darwin-v0.1.5.tar.gz"
  version "v0.1.5"
  license "Apache-2.0 license"

  # depends_on "cmake" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.1.5/ratchjob-aarch64-apple-darwin-v0.1.5.tar.gz"
    end
  end

  on_linux do
    url "https://github.com/ratch-job/ratch-job/releases/download/v0.1.5/ratchjob-x86_64-unknown-linux-musl-v0.1.5.tar.gz"
    if Hardware::CPU.arm?
      url "https://github.com/ratch-job/ratch-job/releases/download/v0.1.5/ratchjob-aarch64-unknown-linux-musl-v0.1.5.tar.gz"
    end
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    #system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install "ratchjob"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ratch-job`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/ratchjob", "--version" 
  end
end
