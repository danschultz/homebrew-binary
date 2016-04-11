# Find downloads at: https://helpx.adobe.com/air/kb/archived-air-sdk-version.html
class AdobeAirSdkFlex < Formula
  desc "Adobe AIR SDK & compiler"
  homepage "https://www.adobe.com/devnet/air/air-sdk-download.html"
  url "http://airdownload.adobe.com/air/mac/download/21.0/AdobeAIRSDK.tbz2"
  version "21.0.0.176"
  sha256 "b6987541869b4bd0d90def3c86fd99f5804e12d6bd60854a73f3b74691a29095"

  conflicts_with "adobe-air-sdk"

  bottle :unneeded

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    To set AIR_HOME:
      export AIR_HOME=#{libexec}
    EOS
  end

  test do
    assert_equal "#{version}\n", shell_output("#{bin}/adt -version")
  end
end
