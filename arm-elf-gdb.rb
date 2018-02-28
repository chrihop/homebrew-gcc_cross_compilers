require 'formula'

class ArmElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/gdb/gdb-8.1.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/gdb/gdb-8.1.tar.xz'
  sha256 'af61a0263858e69c5dce51eab26662ff3d2ad9aa68da9583e8143b5426be4b34'

  depends_on 'arm-elf-binutils'
  depends_on 'arm-elf-gcc'

  def install
    mkdir 'build' do
      system '../configure', '--target=arm-elf-eabi', "--prefix=#{prefix}" ,'--disable-werror'
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end
