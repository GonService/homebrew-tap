<p align="right"><b>Português</b> · <a href="README.en.md">English</a></p>

# GonService · Homebrew e downloads

Os aplicativos da [GonService](https://gonserviceit.com.br) para instalar pelo
[Homebrew](https://brew.sh) (macOS) ou baixar direto para Windows e Linux.

## Projetos

| | App | O que faz | Instalar no Mac |
|---|---|---|---|
| <img src="reader/imagens/icone.png" width="40" alt=""> | **[Reader](reader/)** | Lê e edita markdown, texto e código; lê PDF e Word. | `brew install --cask gonservice/tap/reader-app` |

Cada app tem a sua pasta aqui, com prints e instruções de uso.

## Instalar no Mac (Homebrew)

Com o [Homebrew](https://brew.sh) instalado, cada app sai com um comando
(veja a tabela acima). Para atualizar tudo o que veio daqui:

```bash
brew upgrade --cask $(brew list --cask --full-name | grep '^gonservice/')
```

## Baixar para Windows e Linux

Os instaladores ficam em **[Releases](https://github.com/GonService/homebrew-tap/releases)**,
uma por versão de cada app (a tag começa com o nome do app, ex.: `reader-v1.0.0`).
Cada Release lista qual arquivo baixar para cada sistema.

## Sobre este repositório

- `Casks/` — as receitas do Homebrew. São atualizadas automaticamente a cada
  versão nova de um app; não edite à mão.
- Uma pasta por app (`reader/`, …) — o que ele faz, prints e como usar.
- O código-fonte dos apps fica em repositórios privados da GonService; aqui
  ficam só os instaladores e a documentação.

Os apps são gratuitos e não têm a assinatura paga da Apple nem da Microsoft.
Pelo Homebrew isso não aparece; baixando direto, o sistema pede uma
confirmação na primeira abertura — a pasta de cada app explica como.
