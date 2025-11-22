cask "apigenie" do
  version "0.8.2"
  sha256 "6ec25b69afb0292cf1a11b6519b94b0f25c5d0c39f4bd353a1033ab690b24b47"

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
