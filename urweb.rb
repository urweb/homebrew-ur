class Urweb < Formula
  desc "Ur/Web programming language"
  homepage "http://www.impredicative.com/ur/"
  url "http://www.impredicative.com/ur/urweb-20151220.tgz"
  sha256 "4593d62816685a189e4221907f47eec215fa32051afbf1d589365052a952b594"

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
                          "--with-openssl=/usr/local/opt/openssl",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    system "#{bin}/urweb"
  end
end
