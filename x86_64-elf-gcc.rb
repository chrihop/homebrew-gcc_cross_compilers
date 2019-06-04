require 'formula'

class X8664ElfGcc < Formula
  homepage 'http://gcc.gnu.org'
  url "http://ftp.gnu.org/gnu/gcc/gcc-9.1.0/gcc-9.1.0.tar.xz"
  sha256 "79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "isl"
  depends_on 'x86_64-elf-binutils'

  def install
    binutils = Formulary.factory 'x86_64-elf-binutils'
    ENV['PATH'] += ":#{binutils.prefix/"bin"}"

    mkdir 'build' do
     system '../configure', '--disable-nls', '--target=x86_64-elf','--disable-werror',
                            "--prefix=#{prefix}",
                            "--enable-languages=c",
                            "--without-headers",
                            "--enable-interwork",
                            "--enable-multilib",
                            "--with-gmp=#{Formula["gmp"].opt_prefix}",
                            "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
                            "--with-mpc=#{Formula["libmpc"].opt_prefix}",
                            "--with-isl=#{Formula["isl"].opt_prefix}"
     system 'make all-gcc'
     system 'make install-gcc'
     FileUtils.ln_sf binutils.prefix/"x86_64-elf", prefix/"x86_64-elf"
     system 'make all-target-libgcc'
     system 'make install-target-libgcc'
    end
  end
end
