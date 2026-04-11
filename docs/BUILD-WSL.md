# Compilar o YurOTS no WSL (Ubuntu/Debian)

Este repositório inclui o código em `source/` e o `Makefile.linux` usado no Linux/WSL.

## Dependências

No WSL (Ubuntu como exemplo):

```bash
sudo apt update
sudo apt install -y build-essential g++ \
  libxml2-dev liblua5.1-0-dev \
  libboost-regex-dev libboost-system-dev libboost-filesystem-dev \
  zlib1g-dev
```

Se o pacote Lua tiver outro nome na sua distro, ajuste: o `Makefile.linux` espera `-llua5.1` e includes em `/usr/include/lua5.1`.

## Compilar

Na raiz do repositório:

```bash
make -f Makefile.linux clean
make -f Makefile.linux
```

O binário gerado chama-se `YurOTS`. Pode usar o alias `Makefile_linux` (`make -f Makefile_linux`), que inclui o mesmo makefile.

### Build com AddressSanitizer (opcional, depuração)

```bash
make -f Makefile.linux clean
make -f Makefile.linux BUILD=asan
```

## Correr o servidor

1. Confirme que `config.lua` na raiz aponta para o IP/porta corretos (`ip`, `port`) e que `datadir` e o mapa (`map`, `mapkind`) existem em `data/`.
2. Execute a partir da raiz do projeto (para caminhos relativos funcionarem):

```bash
./YurOTS
```

## Segurança e repositório

- `data/accounts/` e `data/players/` contêm palavras-passe e progressão. **Não publique este repositório como público** sem remover ou anonimizar esses dados.
- As chaves SSH para a VM **não** estão no Git; guarde cópia segura da pasta `chaves/` (ou das chaves que usar) fora do repositório. Ver [SSH-VM.md](SSH-VM.md).

## Windows (referência)

Para compilar no Windows com as toolchains antigas (Dev-C++/MinGW), existe `Makefile.win` com caminhos locais; no WSL use apenas `Makefile.linux`.
