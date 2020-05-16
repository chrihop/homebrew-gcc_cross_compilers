class X8664ElfGcc < Formula
  homepage 'http://gcc.gnu.org'
  url "https://ftp.gnu.org/gnu/gcc/gcc-10.1.0/gcc-10.1.0.tar.xz"
  sha256 "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"

  TARGET = "x86_64-elf"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "isl"
  depends_on "#{TARGET}-binutils"

  def install
    binutils = Formulary.factory "#{TARGET}-binutils"
    host_as  = "#{Formula["#{TARGET}-binutils"].bin}/#{TARGET}-as"
    host_ld  = "#{Formula["#{TARGET}-binutils"].bin}/#{TARGET}-ld"

    ENV['PATH'] += ":#{binutils.prefix/"bin"}"

    mkdir "build" do
    system "../configure", "--target=#{TARGET}",
                           "--disable-nls",
                           "--enable-targets=all",
                           "--disable-werror",
                           "--prefix=#{prefix}",
                           "--enable-languages=c",
                           "--without-headers",
                           "--enable-interwork",
                           "--enable-multilib",
                           "--with-gmp=#{Formula["gmp"].opt_prefix}",
                           "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
                           "--with-mpc=#{Formula["libmpc"].opt_prefix}",
                           "--with-isl=#{Formula["isl"].opt_prefix}",
                           "--with-as=#{host_as}",
                           "--with-ld=#{host_ld}"

    system "make", "all-gcc", "-j"
    system "make", "install-gcc"
    FileUtils.ln_sf binutils.prefix/"#{TARGET}", prefix/"#{TARGET}"

    system "make", "all-target-libgcc", "-j"
    system "make", "install-target-libgcc"
    end
  end
end
