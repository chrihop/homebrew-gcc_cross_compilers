require 'formula'

class I686ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/gdb/gdb-7.12.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/gdb/gdb-7.12.tar.xz'
  sha256 '834ff3c5948b30718343ea57b11cbc3235d7995c6a4f3a5cecec8c8114164f94'

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
