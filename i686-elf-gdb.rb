require 'formula'

class I686ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/gdb/gdb-7.12.1.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/gdb/gdb-7.12.1.tar.xz'
  sha256 '4607680b973d3ec92c30ad029f1b7dbde3876869e6b3a117d8a7e90081113186'

  depends_on 'i686-elf-binutils'
  depends_on 'i686-elf-gcc'

  def install

    mkdir 'build' do
      system '../configure', '--target=i686-elf', "--prefix=#{prefix}", "--disable-werror"
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end
