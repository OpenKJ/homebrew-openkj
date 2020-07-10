# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Openkj < Formula
  desc "OpenKJ karaoke hosting software"
  homepage "https://openkj.org"
  url "https://github.com/OpenKJ/OpenKJ/archive/1.6.7-4.tar.gz"
  version "1.6.7"
  sha256 "689a5f08e5877f8eeffd362c5c61b5164f14fab401f8084ff1faafdb9a8e4360"
  license "GPLv3"
  depends_on "qt5"
  depends_on "gstreamer"
  depends_on "gst-plugins-good"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-ugly"
  depends_on "gst-plugins-base"
  depends_on "taglib"
  depends_on "pkg-config"
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "qmake", "DEFINES+=BREW_BUILD"
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
