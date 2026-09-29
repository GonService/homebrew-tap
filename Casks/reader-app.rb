cask "reader-app" do
  version "1.0.3"
  sha256 "dc2d8ecc1f16948415424533c9463707a57564d9af2cbb56022b80abed3d0e37"

  url "https://github.com/GonService/homebrew-tap/releases/download/reader-v#{version}/Reader-#{version}-macos.zip"
  name "Reader"
  desc "Viewer and editor for Markdown, text and code files"
  homepage "https://github.com/GonService/homebrew-tap"

  depends_on :macos

  app "Reader.app"

  # O Reader não tem assinatura da Apple (a GonService não usa a conta paga
  # de desenvolvedor). Sem isto o macOS bloqueia a primeira abertura com
  # "não foi possível verificar o desenvolvedor". Tira a marca de "baixado
  # da internet" só deste app, que a pessoa pediu para instalar.
  # Roda na caixa de areia do Homebrew: só pode escrever no Reader.app.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Reader.app"],
        writable_paths: ["Reader.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Support/GonService/Reader",
    "~/Library/Preferences/com.gonservice.reader.plist",
  ]
end
