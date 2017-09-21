require 'formula'

class I386ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/gdb/gdb-8.0.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/gdb/gdb-8.0.tar.xz'
  sha256 'f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee'

  depends_on 'i386-elf-binutils'
  depends_on 'i386-elf-gcc'

  def install

    mkdir 'build' do
      system '../configure', '--target=i386-elf', "--prefix=#{prefix}", "--disable-werror"
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end
