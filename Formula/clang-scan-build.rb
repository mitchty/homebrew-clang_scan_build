#!/usr/bin/env ruby
#-*-mode: Ruby; coding: utf-8;-*-
require 'formula'

class ClangScanBuild < Formula
  homepage 'http://llvm.org'
  url "http://llvm.org/svn/llvm-project/cfe/trunk/tools/scan-build", :using => :svn
  depends_on 'svn'
  depends_on 'llvm' => 'with-clang'

  def install
    man1.install "scan-build.1"
    rm "scan-build.bat"
    libexec.install Dir["*"]
    %w/c++-analyzer ccc-analyzer scan-build set-xcode-analyzer/.each do |f|
      bin.install_symlink libexec/f
    end
  end
end
