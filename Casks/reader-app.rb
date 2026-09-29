cask "reader-app" do
  version "1.0.2"
  sha256 "ae7785c621ac3750e79a45f20d623dcd1a4ac97fadb19c0a645892c4e64d82b9"

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
