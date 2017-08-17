require 'formula'

class X8664ElfGcc < Formula
  homepage 'http://gcc.gnu.org'
  url "https://mirrors.tuna.tsinghua.edu.cn/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz"
  mirror "http://mirrors-usa.go-parts.com/gcc/releases/gcc-7.2.0/gcc-7.2.0.tar.xz"
  sha256 "1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "isl"
  depends_on 'x86_64-elf-binutils'

  def install
    binutils = Formulary.factory 'x86_64-elf-binutils'

    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-6'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-6'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-6'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-6'
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
                             "--with-mpc=#{Formula["libmpc"].opt_prefix}"
      system 'make all-gcc'
      system 'make install-gcc'
      FileUtils.ln_sf binutils.prefix/"x86_64-elf", prefix/"x86_64-elf"
      system 'make all-target-libgcc'
      system 'make install-target-libgcc'
      FileUtils.rm_rf share/"man"/"man7"
    end
  end
end
