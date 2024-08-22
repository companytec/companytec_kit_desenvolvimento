# Atualizações kit desenvolvimento concentradores
Este arquivo contém todas as datas e descrições das atualizações realizadas no kit desenvolvimento da Companytec.

### Versão 1.1.39 - 22/08/2024:
```
- Inserida a descrição da função C_SetExtendedPrice no manual da DLL.
```
### Versão 1.1.38 - 03/01/2024:
```
- Alterado hrs console para ler abastecimentos com dados Conecttec ou informações adicionais do TWC.
- Inseridos comandos de leitura de registro de abastecimentos estendidos no manual do protocolo Horustech. 
```
### Versão 1.1.37 - 26/10/2023:
```
- Inserido comando de leitura de abastecimento paf2 no simulador CBC.
- Corrigido bug na configuração de idf no hrs console.
```
### Versão 1.1.36 - 23/08/2023:
```
- Inseridos dados da Concept no readme do repositório.
```
### Versão 1.1.35 - 07/06/2023:
```
- Quando chamava a função Comunica() na DLL, além de retornar status da comunicação, gravava cartões idf e também lia o cartão na posição 40, agora ela só retorna status da comunicação.
```
### Versão 1.1.34 - 14/04/2023:
```
- Ajustada resposta do comando de desabilita e habilita idf no simulador cbc.
- Atualização para a versão 1.6.06 do hrs console.
```
### Versão 1.1.33 - 31/03/2023:
```
- Após enviar pausa, simulador CBC estava sempre respondendo visualização (0).
```
### Versão 1.1.32 - 31/03/2023:
```
- Implementado comando de pausar abastecimentos no simulador CBC.
```
### Versão 1.1.31 - 14/11/2022:
```
- Realizada correção nos códigos de vírgula dos comandos paf da DLL Companytec.
```
### Versão 1.1.30 - 04/11/2022:
```
- Implementados os protocolos metroval CDM05, yenen full dart, tokheim kraus, tokheim 262A, durulsan mode gb e gilbc encore 775 (hrs console).
- Quando carregava firmware V 08.08 com a versão, exemplo, C8.08, software identificava que a automação iria fazer um downgrade (hrs console).
- Colocada a versão do firmware na janela de atualização (hrs console).
```
### Versão 1.1.29 - 26/10/2022:
```
- Havia um exemplo de comunicação com socket em delphi, mas funcionava somente com protocolo companytec, agora funciona com qualquer protocolo.
```
### Versão 1.1.28 - 11/10/2022:
```
- Inserido na DLL o comando para leitura de abastecimentos com 8 caracteres no total a pagar e no volume e com 6 caracteres no preço por litro.
- Atualizado o software de teste da DLL em delphi, inserindo o comando citado acima.
```
### Versão 1.1.27 - 19/09/2022:
```
- Nova versão do hrs console com leitura de tipo de memória.
```
### Versão 1.1.26 - 01/08/2022:
```
- Implementado comando para leitura de casas decimais do preço por litro na DLL e implementado comando no software de teste da DLL.
```
### Versão 1.1.25 - 29/04/2021:
```
- Atualizado simulador CBC para a versão 2.3.5. Corrigido problemas nos comandos de leitura de registro (LR) e leitura de registro paf (LC).
```
### Versão 1.1.25 - 25/04/2021:
```
- Atualizado simulador CBC para a versão 2.3.4. Corrigido problema de preset identificado em total a pagar, agora todo o endereço está sendo liberado.
```
### Versão 1.1.24 - 22/04/2021:
```
- Atualizado simulador CBC para a versão 2.3.3. Corrigido problema na leitura de identificador para o indíce 0000 e adicionado o comando de leitura de calendário estendido.
```
### Versão 1.1.23 - 28/03/2021:
```
- Atualizado simulador CBC para a versão 2.3.1. Corrigido problema de não enviar ")" ao final da string de abastecimento.
```
### Versão 1.1.22 - 23/03/2021:
```
- Atualizado simulador CBC para a versão 2.3.0. Foi implementado o comando de leitura de quantidade de casas decimais configuradas (&TBBCKK).
```
### Versão 1.1.21 - 16/03/2021:
```
- Função AlteraPrecoEstendidoNivel estava dando erro de string. Problema estava na função de verificação de casas decimais no preço passado.
- DLL feita em C implementada no kit desenvolvimento.
```
### Versão 1.1.20 - 17/01/2021:
```
- Corrigido problema na função AlteraPreco onde estava retornando sempre erro de string.
```
### Versão 1.1.19 - 15/10/2021:
```
- Implementada função AlteraPrecoEstendidoNivel na DLL que recebe o valor do preço por litro com até 6 casas.
```
### Versão 1.1.18 - 29/06/2021:
```
- Implementada a opção de leitura de totalizador em volume extendido no software de teste da DLL em Delphi. Função já estava funcionando só não havia a opção no software.
```
### Versão 1.1.17 - 26/05/2021:
```
- Realizada a correção do comando de verificação de comunicação na DLL que sempre retornava como comunicando.
```
### Versão 1.1.16 - 25/05/2021:
```
- Realizada a correção do comando de leitura de abastecimento com identificador na DLL, as casas decimais dos campos total a pagar, volume e preço por litro estavam erradas.
```
### Versão 1.1.14 - 08/03/2021:
```
- Altualizados os manuais da DLL e dos protocolos Horustech e Companytec. As alterações foram as seguintes:
	* Manual da DLL:
		- GetMemoryPointers;
		- C_ReadRegister;
		- C_ReadIdf;
		- C_IncrementIdf;
		- C_SaveTagIdf;
		- C_DeleteTagIdf;
		- C_ClearMemoryIdf;
		- C_PushIdfBlackList;
		- C_RemoveIdfBlackList;
		- C_ReadRegisterIdf.
	* Manual Protocolo Companytec:
		- Corrigido comando de leitura de registro de abastecimento, comandos para automações CBC06 estavam com informações erradas.
	* Manual Protocolo Horustech:
		- Alterada estrutura da resposta do comando Leitura de registro de abastecimento, estava sem informações de casas decimais e sem o tempo de abastecimento.
```
### Versão 1.1.13 - 03/03/2021:
```
- Implementado comando na DLL para retornar os ponteiros de escrita e leitura de abastecimentos da automação;
- Alterado software de teste da DLL em Delphi para coletar tais informações.
```
### Versão 1.1.12 - 09/02/2021:
```
- Implementados comandos na DLL Companytec.
```
### Versão 1.1.11 - 08/02/2021:
```
- Desenvolvido software de teste comunicação socket em VB.
```
### Versão 1.1.10 - 03/02/2021:
```
- Inserido manual de funcionamento do software Simulador CBC.
```
### Versão 1.1.09 - 22/01/2021:
```
- Desenvolvido software de teste em CSharp para enviar comandos à automação e obter o retorno.
```
### Versão 1.1.08 - 28/11/2020:
```
- Implementado o comando para gravar e ler níveis de preços, tanto no comando estendido quanto o normal.
```
### Versão 1.1.07 - 13/11/2020:
```
- Implementado comando para alteração de preço estendido (somente com nível 0) no simulador CBC;
- Implementado comando para leitura de preço estendido (somente com nível 0) no simulador CBC;
- Implementado comando para leitura de ponteiros da memória, retornava sempre zerado no simulador CBC;
- Ajustado o comando de leitura de preço para que envie o valor antes de levantar o bico no simulador CBC.
- Quando enviava o comando de leitura de registro de abastecimento para um espaço de memória vazio do simulador CBC, estava retornando (000...) e na automação retorna (FFF...). Ajustado comando para ficar igual ao da automação.
```
### Versão 1.1.06 - 11/09/2020:
```
- Atualização da função VB_SendReceiveText na DLL Companytec;
- Disponibilizadas duas DLL's com portas de comunicação diferentes e implementada função para a leitura das mesmas.
```
### Versão 1.1.05 - 03/07/2020:
```
- Colocadas informações dos níveis de preços no cadastramento de cartões no software HRS Console;
- Habilitado o envio de troca de preço com vírgula no software HRS Console;
- Ajustada a janela de comando de preset, ficando mais intuitivo o envio do comando no software HRS Console.
```
### Versão 1.1.04 - 30/07/2020:
```
- Atualizados manuais da DLL, protocolo Companytec e protocolo Horustech.
```
### Versão 1.1.03 - 28/07/2020:
```
- Implementado comando para sincronia de calendário estendido tanto na DLL quanto no software de testes.
```
### Versão 1.1.02 - 29/04/2020:
```
- Atualização dos manuais de protocolo de comunicação Horustech e Companytec;
- Atualização do manual do HRS Console.
```
### Versão 1.1.01 - 13/02/2020:
```
- Atualização do test DLL em Delphi, assim como a implementação de comando para ler memória de identificadores.
```
### Versão 1.1.00 - 10/02/2020:
```
- Atualização dos manuais da DLL Companytec assim como a própria DLL, manual do parceiro de software e organização dos documentos.
```
