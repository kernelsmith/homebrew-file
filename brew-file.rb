class BrewFile < Formula
  homepage "https://github.com/rcmdnk/homebrew-file/"
  url "https://github.com/rcmdnk/homebrew-file.git", :tag => "v3.5.3",
    :revision => "7e63e0a9f82d561c5ac13ac32ea2b8b0e3722b1d"
  head "https://github.com/rcmdnk/homebrew-file.git", :branch => "master"
  if build.with? "bash"
    url "https://github.com/rcmdnk/homebrew-file.git", :branch => "bash"
    version "1.1.8"
  end

  option "with-python", "Use python version (same as default)"
  option "with-bash", "Use bash version"
  option "without-completions", "Disable bash/zsh completions"

  skip_clean "bin"

  def install
    bin.install "bin/brew-file"
    (bin+"brew-file").chmod 0755
    (prefix+"etc").install "etc/brew-wrap"
    if build.with? "completions"
      bash_completion.install "etc/bash_completion.d/brew-file"
      zsh_completion.install "share/zsh/site-functions/_brew-file"
    end
  end

  test do
    system "brew", "file", "help"
  end
end
