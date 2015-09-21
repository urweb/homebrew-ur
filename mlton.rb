require 'formula'

# Installs the binary build of MLton.
# Since MLton is written in ML, building from source
# would require an existing ML compiler/interpreter for bootstrapping.

class StandardHomebrewLocation < Requirement
  satisfy HOMEBREW_PREFIX.to_s == "/usr/local"

  def message; <<-EOS.undent
    mlton won't work outside of /usr/local

    Because this uses pre-compiled binaries, it will not work if
    Homebrew is installed somewhere other than /usr/local; mlton
    will be unable to find GMP.
    EOS
  end
end

class Mlton < Formula
  desc "MLton is an open-source, whole-program, optimizing Standard ML compiler."
  homepage 'http://mlton.org'
  url "https://downloads.sourceforge.net/project/mlton/mlton/20130715/mlton-20130715-1.amd64-darwin.gmp-macports.tgz"
  version "20130715"
  sha256 "a9bfff3bc5a793e84306f98cd60f195a8139902900f96e1072d13c0813b49c10"

  # We download and install the version of MLton which is statically linked to libgmp, but all
  # generated executables will require gmp anyway, hence the dependency
  depends_on StandardHomebrewLocation
  depends_on 'gmp'

  def install
    cd "local" do
      # Remove OS X droppings
      rm Dir["man/man1/._*"]
      mv "man", "share"
      prefix.install Dir['*']
    end
  end
end
