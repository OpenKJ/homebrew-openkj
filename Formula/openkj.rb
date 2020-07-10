# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Openkj < Formula
  desc "OpenKJ karaoke hosting software"
  homepage "https://openkj.org"
  url "https://github.com/OpenKJ/OpenKJ/archive/1.6.7-3.tar.gz"
  version "1.6.7"
  sha256 "99665f921fb717aae1cea6bed5ce54fab52669fb0ed12ea3befe9e4c0595b1e5"
  license "GPLv3"
  depends_on "qt5"
  depends_on "gstreamer"
  depends_on "pkg-config"
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "qmake"
    system "make"
    system "cp", "-R", "OpenKJ/OpenKJ.app", "#{prefix}/"
    # system "cmake", ".", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test OpenKJ`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
