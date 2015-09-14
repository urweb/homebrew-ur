# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Urweb < Formula
  desc "Ur/Web"
  homepage "http://www.impredicative.com/ur/"
  url "http://www.impredicative.com/ur/urweb-20150520.tgz"
  version "20150520"
  sha256 "35f31c9b39093dc50be72731ae7288245befc1b98bfcdcc481db15a8c937f41a"

  # depends_on "cmake" => :build
  #depends_on 'mlton'

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "aclocal"

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test urweb`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
