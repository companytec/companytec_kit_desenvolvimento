<h1> Kit desenvolvimento concentradores</h1>
<p>Esse kit de desenvolvimento irá abranger todos os modelos de concentradores que a Companytec comercializa ou já comercializou.</p>
<p>Em primeiro momento é necessário saber que existem duas possibilidade de comunicação com os equipamentos, uma através da DLL e outra através do protocolo nativo.</p>
<p>Caso sua intuição seja trabalhar com a DLL, nesse kit há uma pasta relacionada a ela e onde encontrarás os manuais, onde é possível verificar todas as funções que a mesma possui, exemplos de softwares para a integração com ela e a própria DLL.</p>
<p>Agora se sua intuição é trabalhar com o protocolo nativo, neste kit também há alguns exemplos em diversas linguagens demonstrando como realizar a conexão via socket com os equipamentos e os manuais para verificar quais comandos a automação irá responder, então para que a automação comunique com o software é só abrir uma conexão via socket e enviar os comandos desejados, feito isto ela irá responder. Lembrando que na conexão via socket é necessário colocar o IP que está configurado na automação juntamente com sua porta de comunicação, colocarei abaixo as portas disponíveis nas automações:</p>

* Porta 857: disponível para uma segunda aplicação;
* Porta 1771: porta indicada para utilização dos softwares de configuração/manutenção da Companytec;
* Porta 2001: porta indicada para utilização do software de pista do posto.

<p>Agora que já sabemos sobre os tipos de integração que temos, chegou a hora de verificar qual protocolo de comunicação utilizar caso a opção não seja trabalhar com a DLL.</p>
<p>Na Companytec, temos três tipos de protocolos de comunicação, o CBC, o Companytec e o Horustech.</p>
<p>O protocolo CBC foi desenvolvido para trabalhar com os modelos mais antigos de automação, os modelos CBC. Esses modelos foram fabricados desde a CBC01 até a CBC06, essa última parou de ser fabricada por volta do ano de 2012. Depois desse ano, a Companytec começou a fabricar os modelos Horustech e com ela, se viu a necessidade de fazer um novo protocolo, o Horustech, onde o mesmo tinha uma sintaxe diferente do antigo e também era mais robusto, corrigindo possíveis problemas do anterior.</p>
<p>Com essa mudança a Companytec se viu diante de um impasse, agora como tinha um protocolo novo, não tinha como fazer as softwares houses trabalharem somente com esse protocolo, pois isso iria gerar um grande transtorno para as mesmas, teriam que reescrever todo o código para se adaptar ao novo modelo, então foi aí que surgiu a ideia de fazer um terceiro protocolo, o Companytec, que nada mais é do que a sintaxe do protocolo CBC adaptado aos modelos mais atuais, ou seja, a Horustech e Concept.</p>
<p>Fazendo um resumo do explicado, caso sua intenção seja desenvolver um software para trabalhar com todos os modelos de automação (CBC, Horustech e Concept), pode usar o protocolo CBC/Companytec, mas caso a sua intenção seja trabalhar somente com as automações mais atuais (Horustech e Concept), pode realizar o desenvolvimento no protocolo Horustech.</p>
<p>Agora que já sabemos sobre os tipos de protocolos e automações que a Companytec comercializa, vamos adentrar sobre a automação Concept.</p>
<p>A Concept é o modelo mais atual de automação da Companytec, ela além de ser uma automação de gerenciamento de bombas de combustíveis também é uma automação para a parte de medição de tanque e monitoramento ambiental.</p>
<p>Conforme informado acima, a Concept trabalha tanto no protocolo CBC/Companytec quanto no protocolo Horustech e a comunicação dela é feita da mesma maneira que os outros modelos de automação, conexão via socket com IP e porta, então ao instalá-la não será necessária nenhuma alteração em seu software.</p>
<p>Para sua comunicação na parte de medição de tanque e monitoramento ambiental, a Concept trabalha com o protocolo TLS-350 e para comunicar com ela, é só abrir uma conexão via socket com seu IP na porta 10002, essa comunicação é feita da mesma forma que na parte de automação de gerenciamento de bombas só que em uma porta diferente.</p>
<p>Adentrando no protocolo TLS-350 a automação responderá somente alguns comandos que nele contém, colocarei abaixo os comandos implementados na Concept: </p>

* i201 : TANK_STATUS;
* i202 : DELIVERY_REPORT_LIST;
* i20C : DELIVERY_REPORT;
* i205 : TANK_ALARMS_STATUS;
* i206 : TANK_ALARMS_REPORT;
* i301 : LEAK_SENSOR_STATUS;
* i302 : LEAK_SENSOR_REPORT;
