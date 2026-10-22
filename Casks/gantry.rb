cask "gantry" do
  version "0.47.0"
  sha256 "a2dee701fd32fa77e0ad395268a0d1127cb2a1dee02fa2c179232be5b7a67b50"

  url "https://github.com/GonService/homebrew-tap/releases/download/gantry-v#{version}/Gantry-#{version}-macos.zip"
  name "Gantry"
  desc "Manage containers, VMs and Kubernetes clusters on local and remote machines"
  homepage "https://github.com/GonService/homebrew-tap/tree/main/gantry"

  depends_on :macos

  app "Gantry.app"

  # O Gantry não tem assinatura da Apple (a GonService não usa a conta paga
  # de desenvolvedor). Sem isto o macOS bloqueia a primeira abertura com
  # "não foi possível verificar o desenvolvedor". Tira a marca de "baixado
  # da internet" só deste app, que a pessoa pediu para instalar.
  # Roda na caixa de areia do Homebrew: só pode escrever no Gantry.app.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Gantry.app"],
        writable_paths: ["Gantry.app"],
        writable_base:  :appdir
  end

  # Só com --zap: apaga máquinas, projetos e preferências salvas. Os
  # containers e as VMs continuam nas máquinas.
  zap trash: [
    "~/Library/Application Support/gantry",
    "~/Library/Caches/com.wails.Gantry",
    "~/Library/Preferences/com.wails.Gantry.plist",
    "~/Library/WebKit/com.wails.Gantry",
  ]
end
