class Urweb < Formula
  desc "Ur/Web programming language"
  homepage "http://www.impredicative.com/ur/"
  url "http://www.impredicative.com/ur/urweb-20151018.tgz"
  # version "20151018"
  sha256 "c05f3aba7d617b1f7704c0810d51074bd44a889f5e59c8da7f82f650cb15e522"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "openssl" => :build
  depends_on "mlton"
  depends_on :postgresql => :optional
  depends_on :mysql => :optional

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    system "#{bin}/urweb"
  end
end
