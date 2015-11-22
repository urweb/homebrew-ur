class Urweb < Formula
  desc "Ur/Web programming language"
  homepage "http://www.impredicative.com/ur/"
  url "http://www.impredicative.com/ur/urweb-20151122.tgz"
  sha256 "de4f3b26e5449f5f82cb9d02d19eb3f3e6187742ccc5d27aa1183c4ab6910f8f"

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
