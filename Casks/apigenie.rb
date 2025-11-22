cask "apigenie" do
  version "0.8.3"
  sha256 "4b7b4ba4d739497f55e6c3c0b3458178acdd6e9c8d2b8dd21b37b4fcfe220393"

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
