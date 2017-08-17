require 'formula'

class X8664ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/gdb/gdb-8.0.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/gdb/gdb-8.0.tar.xz'
  sha256 'f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee'

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
