cask "apigenie" do
  version "0.8.5"
  sha256 "4e6f9d88280799d871326f66337c619b2e405eb612193415e70ba9c2984492bf"

  url "https://storage.googleapis.com/apigenie.pl/dist/#{version}/apigenie-#{version}-macos15-arm64.zip",
      verified: "storage.googleapis.com/apigenie.pl/"
  name "apigenie"
  desc "Best software for OpenAPI development"
  homepage "https://apigenie.pl/"

  livecheck do
    url :url
    strategy :header_match
  end

  depends_on macos: ">= :sonoma"

  binary "apigenie-#{version}-macos15-arm64", target: "apigenie"
end
