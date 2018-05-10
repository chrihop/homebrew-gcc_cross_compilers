require 'formula'

class I686ElfGcc < Formula
  homepage 'http://gcc.gnu.org'
  url "https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/gcc-8.1.0/gcc-8.1.0.tar.xz"
  mirror "http://mirrors-usa.go-parts.com/gcc/releases/gcc-8.1.0/gcc-8.1.0.tar.xz"
  sha256 "1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "isl"
  depends_on 'i686-elf-binutils'

  def install
    binutils = Formulary.factory 'i686-elf-binutils'


    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-8'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-8'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-8'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-8'
    ENV['PATH'] += ":#{binutils.prefix/"bin"}"

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i686-elf',
                             '--disable-werror',
                             "--prefix=#{prefix}",
                             "--enable-languages=c",
                             "--without-headers",
                             "--enable-interwork",
                             "--enable-multilib",
                             "--with-gmp=#{Formula["gmp"].opt_prefix}",
                             "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
                             "--with-mpc=#{Formula["libmpc"].opt_prefix}"
                             "--with-isl=#{Formula["isl"].opt_prefix}"
      system 'make all-gcc'
      system 'make install-gcc'
      FileUtils.ln_sf binutils.prefix/"i686-elf", prefix/"i686-elf"
      system 'make all-target-libgcc'
      system 'make install-target-libgcc'
      FileUtils.rm_rf share/"man"/"man7"
    end
  end
end
