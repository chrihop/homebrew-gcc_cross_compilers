class I386ElfBinutils < Formula
  homepage "https://www.gnu.org/software/binutils/"
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.gz"
  sha256 "53537d334820be13eeb8acb326d01c7c81418772d626715c7ae927a7d401cab3"

  depends_on 'gcc' => :build

  TARGET = "i386-elf"

  def install
    mkdir 'build' do
      system "../configure", "--target=#{TARGET}",
                             "--enable-targets=all",
                             "--prefix=#{prefix}",
                             "--disable-nls", 
                             "--disable-werror",
                             "--enable-interwork",
                             "--enable-multilib"
      system "make", "all", "-j"
      system "make", "install"
    end
  end
end
