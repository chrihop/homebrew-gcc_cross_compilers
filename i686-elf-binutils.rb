require 'formula'

class I686ElfBinutils < Formula
  homepage 'https://www.gnu.org/software/binutils/'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.xz'
  sha256 '0ab6c55dd86a92ed561972ba15b9b70a8b9f75557f896446c82e8b36e473ee04'

  depends_on 'gcc' => :build
  def install

    mkdir 'build' do
      system "../configure", "--prefix=#{prefix}",
                             "--disable-nls", 
                             "--target=i686-elf",
                             "--disable-werror",
                             "--enable-interwork",
                             "--enable-multilib"
      system "make", "all", "-j"
      system "make", "install"
    end
  end

end
