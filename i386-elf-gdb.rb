require 'formula'

class I386ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/gdb/gdb-8.3.tar.xz'
  sha256 '802f7ee309dcc547d65a68d61ebd6526762d26c3051f52caebe2189ac1ffd72e'

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
