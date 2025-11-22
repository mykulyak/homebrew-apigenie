cask "apigenie" do
  version "0.8.2"
  sha256 "bf5a4d59ce87617745b2967d96ddcd0534338824039e9bfd34fb99b3c8df0a15"

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
