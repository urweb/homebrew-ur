class Urweb < Formula
  desc "Ur/Web programming language"
  homepage "http://www.impredicative.com/ur/"
  url "http://www.impredicative.com/ur/urweb-20160306.tgz"
  sha256 "d70194109040c14d65bb4170a36dcae696070b2a6f374e6215e65caaddb6da44"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "openssl"
  depends_on "mlton" => :build
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
