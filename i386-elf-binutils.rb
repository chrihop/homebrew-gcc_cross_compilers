require 'formula'

class I386ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/binutils-2.31.1.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.31.1.tar.xz'
  sha256 '5d20086ecf5752cc7d9134246e9588fa201740d540f7eb84d795b1f7a93bca86'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-8'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-8'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-8'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-8'

    mkdir 'build' do
      system "../configure", "--prefix=#{prefix}",
                             "--disable-nls", 
                             "--target=i386-elf",
                             "--disable-werror",
                             "--enable-interwork",
                             "--enable-multilib",
                             "--enable-gold=yes"
      system 'make all'
      system 'make install'
    end
  end

end
