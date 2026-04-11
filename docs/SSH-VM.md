# Acesso SSH à máquina virtual (VM)

Este guia descreve o fluxo habitual para ligar por SSH à VM onde o servidor pode estar hospedado. **Chaves privadas não devem ser commitadas** no Git; mantenha-as num local seguro (por exemplo a pasta local `chaves/` no seu PC, backups encriptados, ou gestor de segredos).

## Informação do servidor

- O endereço IP público usado pelo OT no `config.lua` está no campo `ip` (ex.: rede e clientes usam esse valor). **Confirme no painel da cloud ou com `config.lua` atual** qual é o IP correto da VM antes de ligar.
- O utilizador SSH depende da imagem da VM (ex.: `ubuntu`, `debian`, `root`). Use o que o fornecedor da VM indica.

## Pré-requisitos no seu PC (WSL ou Linux)

1. Permissões corretas na chave privada (exemplo):

   ```bash
   chmod 600 /caminho/para/sua_chave
   ```

2. Teste a ligação (substitua utilizador, IP e ficheiro da chave):

   ```bash
   ssh -i /caminho/para/sua_chave -o IdentitiesOnly=yes UTILIZADOR@IP_DA_VM
   ```

   Na primeira ligação, aceite a impressão digital (`yes`) se confiar no host.

## Windows (PowerShell / OpenSSH)

Se as chaves estão no Windows:

```powershell
ssh -i C:\caminho\para\sua_chave UTILIZADOR@IP_DA_VM
```

## Encaminhamento de porta / firewall

- Na cloud, abra a porta **22** (SSH) só para os IPs de confiança, se possível.
- Se o jogo ou o painel usam outras portas (ex. **7171** do `config.lua`), abra-as na firewall da VM e nas regras do grupo de segurança da cloud.

## Copiar ficheiros (ex.: actualizar o servidor)

Do seu PC para a VM:

```bash
scp -i /caminho/para/sua_chave -r ./YurOTS ./config.lua ./data UTILIZADOR@IP_DA_VM:/caminho/destino/
```

## Se perder o acesso

1. Recupere ou reponha a chave no painel da VM (consola web, “recovery”, ou anexar nova chave pública).
2. Confirme que o serviço SSH na VM está activo e que a porta 22 está acessível.
3. Nunca commite a chave **privada**; apenas a **pública** (`.pub`) pode ser registada no `authorized_keys` da VM.

## Ligação ao repositório

Depois de clonar este repo na VM ou no WSL, siga [BUILD-WSL.md](BUILD-WSL.md) para recompilar o `YurOTS` sem depender de binários versionados.
