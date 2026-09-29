cask "reader-app" do
  version "1.0.4"
  sha256 "700ed2f4b9573da8f5367f1997efab22dd3c5b0d748fbdb9f033bfc8823ddc68"

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
    "~/Library/Preferences/com.gonservice.reader-app.plist",
    "~/Library/Preferences/com.gonservice.reader.plist",
    "~/Library/WebKit/com.gonservice.reader-app",
    "~/Library/WebKit/com.gonservice.reader",
    "~/Library/Caches/com.gonservice.reader-app",
    "~/Library/Caches/com.gonservice.reader",
  ]
end
