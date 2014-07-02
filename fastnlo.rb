require "formula"

class Fastnlo < Formula
  homepage 'http://fastnlo.hepforge.org'
  url 'http://fastnlo.hepforge.org/code/v21/fastnlo_reader-2.1.0-1689.tar.gz'
  sha1 'd71b829c3ea332145dc0e6b3bed12d90cf0a373c'
  version '2.1.0.1689'

  depends_on 'lhapdf'  => :recommended
  depends_on :fortran

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
    ]

    system "./configure", *args
    system "make", "install"
  end

  test do
    system "#{bin}/fnlo-cppread", "-h"
  end
end
