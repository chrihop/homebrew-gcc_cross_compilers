require 'formula'

class X8664ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/binutils-2.29.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.29.tar.xz'
  sha256 '0b871e271c4c620444f8264f72143b4d224aa305306d85dd77ab8dce785b1e85'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-6'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-6'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-6'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-6'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=x86_64-elf','--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'

    end
  end

end
