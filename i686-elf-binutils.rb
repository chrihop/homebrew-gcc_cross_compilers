require 'formula'

class I686ElfBinutils < Formula
  homepage 'https://www.gnu.org/software/binutils/'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/binutils-2.31.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.31.tar.xz'
  sha256 '231036df7ef02049cdbff0681f4575e571f26ea8086cf70c2dcd3b6c0f4216bf'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-8'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-8'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-8'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-8'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i686-elf',
             '--disable-werror', '--enable-interwork', '--enable-multilib',
             '--enable-gold=yes', '--prefix=#{prefix}'
      system 'make all'
      system 'make install'
    end
  end

end
