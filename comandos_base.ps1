
make -f Makefile.linux clean && make -f Makefile.linux
make -f Makefile.linux clean && make -f Makefile.linux BUILD=asan
make -f Makefile.linux asan


# Sim. Use a mesma chave e usuário de antes. No PowerShell, dá para fixar variáveis e só repetir o ssh:

$key = "c:\GitHub\ot-server-760-2026-war\chaves\204.216.162.78.key"
$hostvmocioracle = "ubuntu@204.216.162.78"
# Subir (em segundo plano + log em arquivo)
ssh -i $key $hostvmocioracle "cd ~/yurots && nohup ./YurOTS >> yurots.log 2>&1 & echo PID: $!"


# Derrubar
ssh -i $key $hostvmocioracle "pkill -f '/yurots/YurOTS' || pkill -x YurOTS; echo done"
	# (Se nada estiver rodando, pkill pode devolver código de erro; o servidor para mesmo assim.)

# Ver log (últimas linhas)
ssh -i $key $hostvmocioracle "tail -n 100 ~/yurots/yurots.log"

# Acompanhar log ao vivo (como “console”)
ssh -i $key $hostvmocioracle "tail -f ~/yurots/yurots.log"
# Sair do acompanhamento: Ctrl+C (só encerra o tail na sessão SSH, não mata o servidor).


# Conferir se está rodando
ssh -i $key $hostvmocioracle "pgrep -af YurOTS || echo 'nao rodando'"

# Observação: O YurOTS em si não grava log em arquivo; o que aparece no “console” só vira histórico se você redirecionar com nohup ... >> yurots.log 2>&1 como acima. Se já tiver subido sem redirecionamento, não haverá yurots.log até você subir de novo com esse comando.


$key = "c:\GitHub\ot-server-760-2026-war\chaves\204.216.162.78.key"
$hostvmocioracle = "ubuntu@204.216.162.78"
ssh -i $key $hostvmocioracle "pkill -f '/yurots/YurOTS' || pkill -x YurOTS; echo done"
ssh -i $key $hostvmocioracle "cd ~/yurots && nohup ./YurOTS >> yurots.log 2>&1 & echo PID: $!"
ssh -i $key $hostvmocioracle "pgrep -af YurOTS || echo 'nao rodando'"