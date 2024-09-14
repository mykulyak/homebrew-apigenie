cask "apigenie" do
  version "0.8.0"
  sha256 "f4b343b6c2a08ecfa3754f209481a55dfc3209bac4d51226c4c7785e22164154"

  url "https://apigenie.pl/dist/#{version}/apigenie-#{version}-macos_14-arm64"
  name "apigenie"
  desc "Best software for OpenAPI development"
  homepage "https://apigenie.pl/"

  livecheck do
    url :url
    strategy :header_match
  end

  depends_on macos: ">= :sonoma"

  app "API Genie.app"

  # zap trash: ""
end
