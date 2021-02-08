#Atualizações kit desenvolvimento concentradores
Este arquivo contém todas as datas e descrições das atualizações realizadas no kit desenvolvimento da Companytec.

10/02/2020:
- Atualização dos manuais da DLL Companytec assim como a própria DLL, manual do parceiro de software e organização dos documentos.
*******************************************************************
13/02/2020:
- Atualização do test DLL em Delphi, assim como a implementação de comando para ler memória de identificadores.
*******************************************************************
29/04/2020:
- Atualização dos manuais de protocolo de comunicação Horustech e Companytec;
- Atualização do manual do HRS Console.
*******************************************************************
28/07/2020:
- Implementado comando para sincronia de calendário estendido tanto na DLL quanto no software de testes.
*******************************************************************
30/07/2020:
- Atualizados manuais da DLL, protocolo Companytec e protocolo Horustech.
*******************************************************************
03/07/2020:
- Colocadas informações dos níveis de preços no cadastramento de cartões no software HRS Console;
- Habilitado o envio de troca de preço com vírgula no software HRS Console;
- Ajustada a janela de comando de preset, ficando mais intuitivo o envio do comando no software HRS Console.
*******************************************************************
11/09/2020:
- Atualização da função VB_SendReceiveText na DLL Companytec;
- Disponibilizadas duas DLL's com portas de comunicação diferentes e implementada função para a leitura das mesmas.
*******************************************************************
13/11/2020:
- Implementado comando para alteração de preço estendido (somente com nível 0) no simulador CBC;
- Implementado comando para leitura de preço estendido (somente com nível 0) no simulador CBC;
- Implementado comando para leitura de ponteiros da memória, retornava sempre zerado no simulador CBC;
- Ajustado o comando de leitura de preço para que envie o valor antes de levantar o bico no simulador CBC.
- Quando enviava o comando de leitura de registro de abastecimento para um espaço de memória vazio do simulador CBC, estava retornando (000...) e na automação retorna (FFF...). Ajustado comando para ficar igual ao da automação.
*******************************************************************
28/11/2020:
- Implementado o comando para gravar e ler níveis de preços, tanto no comando estendido quanto o normal.
*******************************************************************
22/01/2021:
- Desenvolvido software de teste em CSharp para enviar comandos à automação e obter o retorno.
*******************************************************************
03/02/2021:
- Inserido manual de funcionamento do software Simulador CBC.
*******************************************************************
08/02/2021:
- Desenvolvido software de teste comunicação socket em VB.
*******************************************************************
