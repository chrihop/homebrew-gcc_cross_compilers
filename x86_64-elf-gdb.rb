require 'formula'

class X8664ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://ftp.gnu.org/gnu/gdb/gdb-9.1.tar.xz'
  sha256 '699e0ec832fdd2f21c8266171ea5bf44024bd05164fdf064e4d10cc4cf0d1737'

  depends_on 'x86_64-elf-binutils'
  depends_on 'x86_64-elf-gcc'

  def install

    mkdir 'build' do
      system '../configure', '--target=x86_64-pc-linux', "--prefix=#{prefix}"
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end
