<b><h1>DLL-Protocolo-Companytec</b></h1>
<p> Repositório criado para o versionamento da DLL - Protocolo Companytec<p>
<p> Todas as alterações realizadas e comandos implementados estão descritos abaixo<p>
<h1></h1>

### Versão 5.0.0 - 05/02/2020
```
- Inicializado o versionamento;
- Corrigidos os comandos de preset e preset identificado.
```

### Versão 5.1.0 - 12/02/2020
```
- Colocado comando de leitura de registro de identificador;
- Colocado comando para leitura de abastecimento com 8 dígitos no total a pagar e no volume;
- Corrigido comando de visualização identificada.
```

### Versão 5.2.0 - 28/07/2020
```
- Implementado comando para sincronia de calendário estendido.
```

### Versão 5.3.0 - 11/09/2020
```
- Atualização da função VB_SendReceiveText.
- Disponibilizadas duas DLL's com portas de comunicação diferentes e implementada função para a leitura das mesmas.
```

### Versão 5.4.0 - 28/11/2020
```
- Implementado o comando para gravar e ler níveis de preços, tanto no comando estendido quanto o normal.
```

### Versão 5.5.0 - 03/03/2021
```
- Implementado comando para retornar os ponteiros de escrita e leitura de abastecimentos da automação;
```

### Versão 5.5.1 - 25/05/2021
```
- Realizada a correção do comando de leitura de abastecimento com identificador, as casas decimais dos campos total a pagar, volume e preço por litro estavam erradas.
```

### Versão 5.6.0 - 26/05/2021
```
- Realizada a correção do comando de verificação de comunicação que sempre retornava como comunicando.
```

### Versão 5.7.0 - 15/10/2021
```
- Implementada função AlteraPrecoEstendidoNivel que recebe o valor do preço por litro com até 6 casas.
```

### Versão 5.7.1 - 17/01/2021
```
- Corrigido problema na função AlteraPreco onde estava retornando sempre erro de string.
```

### Versão 5.8.0 - 16/03/2021
```
- Função AlteraPrecoEstendidoNivel estava dando erro de string. Problema estava na função de verificação de casas decimais no preço passado.
```

### Versão 5.9.0 - 01/08/2022
```
- Implementada a função ConsultaCodigoVirgulaPPL.
```