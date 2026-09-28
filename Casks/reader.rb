cask "reader" do
  version "1.0.0"
  sha256 "b86fda299eea167b9059e1751fb3551a4e50f1fe66256a696b6bb220f23645b8"

  url "https://github.com/GonService/homebrew-tap/releases/download/reader-v#{version}/Reader-#{version}-macos.zip"
  name "Reader"
  desc "Reader and editor for Markdown, text and code files"
  homepage "https://github.com/GonService/homebrew-tap"

  depends_on macos: ">= :big_sur"

  app "Reader.app"

  # O Reader não tem assinatura da Apple (a GonService não usa a conta paga
  # de desenvolvedor). Sem isto o macOS bloqueia a primeira abertura com
  # "não foi possível verificar o desenvolvedor". Tira a marca de "baixado
  # da internet" só deste app, que a pessoa pediu para instalar.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Reader.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/GonService/Reader",
    "~/Library/Preferences/com.gonservice.reader.plist",
  ]
end
