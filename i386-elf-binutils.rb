require 'formula'

class I386ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/binutils-2.30.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.30.tar.xz'
  sha256 '6e46b8aeae2f727a36f0bd9505e405768a72218f1796f0d09757d45209871ae6'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-7'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-7'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-7'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-7'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i386-elf','--disable-werror',
                             '--enable-gold=yes', '--enable-interwork', '--enable-multilib',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
    end
  end

end
