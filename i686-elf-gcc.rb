require 'formula'

class I686ElfGcc < Formula
  homepage 'http://gcc.gnu.org'
  url "http://ftp.gnu.org/gnu/gcc/gcc-9.1.0/gcc-9.1.0.tar.xz"
  sha256 "79a66834e96a6050d8fe78db2c3b32fb285b230b855d0a66288235bc04b327a0"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "isl"
  depends_on "i686-elf-binutils"

  def install
    binutils = Formulary.factory 'i686-elf-binutils'

    ENV['PATH'] += ":#{binutils.prefix/"bin"}"
    
    mkdir 'build' do
    system '../configure', '--disable-nls',
                           '--target=i686-elf',
                           '--disable-werror',
                           "--prefix=#{prefix}",
                           "--enable-languages=c",
                           "--without-headers",
                           "--enable-interwork",
                           "--enable-multilib",
                           "--with-gmp=#{Formula["gmp"].opt_prefix}",
                           "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
                           "--with-mpc=#{Formula["libmpc"].opt_prefix}",
                           "--with-isl=#{Formula["isl"].opt_prefix}"
    system "make", "all-gcc", "-j"
    system "make", "install-gcc"
    FileUtils.ln_sf binutils.prefix/"i686-elf", prefix/"i686-elf"
    system "make", "all-target-libgcc", "-j"
    system "make", "install-target-libgcc"
    end
  end
end
