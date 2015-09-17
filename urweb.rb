class Urweb < Formula
  desc "Ur/Web programming language"
  homepage "http://www.impredicative.com/ur/"
  url "http://www.impredicative.com/ur/urweb-20150819.tgz"
  version "20150819"
  sha256 "d694b951b05549b6a1b9a2a3430e2660fb4694c324a9386610a17fa506a6ed3e"

  # depends_on "cmake" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "openssl" => :build
  depends_on 'mlton'
  depends_on :postgresql => :optional
  depends_on :mysql => :optional


  def install

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "false"
  end
end
