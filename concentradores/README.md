<details open>
<summary>🇧🇷 Português</summary>

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

</details>

<details>
<summary>🇪🇸 Español</summary>

<h1>Kit de desarrollo de concentrador</h1>
<p>Este kit de desarrollo cubrirá todos los modelos de concentradores que Companytec vende o ya ha vendido.</p>
<p>Antes que nada debes saber que existen dos posibilidades para comunicarte con el equipo, una a través de la DLL y otra a través del protocolo nativo.</p>
<p>Si tu intuición es trabajar con la DLL, en este kit hay una carpeta relacionada con ella y donde encontrarás los manuales, donde podrás consultar todas las funciones que tiene, ejemplos de software para la integración con ella y la propia DLL.</p>
<p>Ahora si tu intuición es trabajar con el protocolo nativo, en este kit también hay algunos ejemplos en diferentes idiomas que demuestran cómo conectarse vía socket con el equipo y manuales para verificar a qué comandos responderá la automatización, así para que la automatización se comunique con el software, simplemente abra una conexión vía socket y envíe los comandos deseados, una vez hecho esto responderá. Recordando que al conectarse vía socket es necesario ingresar la IP que está configurada en la automatización junto con su puerto de comunicación, a continuación listaré los puertos disponibles en las automatizaciones:</p>

* Puerto 857: disponible para una segunda aplicación;
* Puerto 1771: puerto recomendado para utilizar el software de configuración/mantenimiento de Companytec;
* Puerto 2001: puerto recomendado para utilizar el software de seguimiento de la estación.

<p>Ahora que sabemos los tipos de integración que tenemos, es momento de comprobar qué protocolo de comunicación usar si la opción es no trabajar con la DLL.</p>
<p>En Companytec contamos con tres tipos de protocolos de comunicación, CBC, Companytec y Horustech.</p>
<p>El protocolo CBC fue desarrollado para funcionar con los modelos de automatización más antiguos, los modelos CBC. Estos modelos se fabricaron desde CBC01 hasta CBC06, este último dejó de fabricarse alrededor del año 2012. Después de ese año, Companytec comenzó a fabricar modelos Horustech y con ello se vio la necesidad de crear un nuevo protocolo, Horustech, donde tuviera una sintaxis diferente al anterior y además fuera más robusto, corrigiendo posibles problemas con el anterior.</p>
<p>Con este cambio Companytec se encontró con un impasse, ahora que contaba con un nuevo protocolo, no había manera de hacer que las casas de software trabajaran solo con este protocolo, ya que esto les causaría grandes inconvenientes, tendrían que reescribir todo el código para adaptarse al nuevo modelo, entonces surgió la idea de crear un tercer protocolo, Companytec, que no es más que la sintaxis del protocolo CBC adaptada a los modelos más actuales, es decir, Horustech y Concept. arriba.</p>
<p>Para resumir lo explicado, si tu intención es desarrollar software para trabajar con todos los modelos de automatización (CBC, Horustech y Concept), puedes utilizar el protocolo CBC/Companytec, pero si tu intención es trabajar solo con los automatizaciones más actuales (Horustech y Concept), puedes realizar el desarrollo utilizando el protocolo Horustech.</p>
<p>Ahora que conocemos los tipos de protocolos y automatizaciones que comercializa Companytec, profundicemos en la automatización de Concept.</p>
<p>Concept es el modelo de automatización más actual de Companytec. Además de ser una automatización de gestión de bombas de combustible, también es una automatización de medición de tanques y monitoreo ambiental.</p>
<p>Como se indicó anteriormente, Concept funciona tanto sobre el protocolo CBC/Companytec como sobre el protocolo Horustech y su comunicación se realiza de la misma forma que otros modelos de domótica, conexión mediante socket con IP y puerto, por lo que al instalarlo no será necesario realizar cambios en su software.</p>
<p>Para su comunicación en la parte de medición de tanques y monitoreo ambiental, Concept trabaja con el protocolo TLS-350 y para comunicarse con él basta con abrir una conexión vía socket con su IP en el puerto 10002, esta comunicación se realiza de la misma manera que en la parte de automatización de gestión de bombas pero en un puerto diferente.</p>
<p>Ingresando al protocolo TLS-350, la automatización solo responderá a algunos comandos contenidos en el mismo, incluiré los comandos implementados en Concepto a continuación: </p>

* i201 : TANK_STATUS;
* i202 : DELIVERY_REPORT_LIST;
* i20C : DELIVERY_REPORT;
* i205 : TANK_ALARMS_STATUS;
* i206 : TANK_ALARMS_REPORT;
* i301 : LEAK_SENSOR_STATUS;
* i302 : LEAK_SENSOR_REPORT;

</details>


<details>
<summary>🇺🇸 English</summary>

<h1>Concentrator Development Kit</h1>
<p>This development kit covers all concentrator models that Companytec currently sells or has previously marketed.</p>
<p>First, it is important to note that there are two ways to communicate with the equipment: via a DLL or via the native protocol.</p>
<p>If you intend to work with the DLL, this kit includes a dedicated folder containing manuals—where you can review all available functions—as well as software integration examples and the DLL file itself.</p>
<p>If you prefer to work with the native protocol, this kit also provides examples in various programming languages ​​demonstrating how to establish a socket connection with the equipment. You will also find manuals detailing the commands to which the automation system responds; to facilitate communication, simply open a socket connection and send the desired commands, and the system will respond accordingly. Please note that when establishing a socket connection, you must specify the IP address configured for the automation system along with its communication port. The available ports are listed below:</p>

* Port 857: available for a secondary application;
* Port 1771: recommended for use with Companytec configuration/maintenance software;
* Port 2001: recommended for use with the gas station forecourt management software.

<p>Now that we have covered the available integration methods, the next step is to determine which communication protocol to use if you choose not to work with the DLL.</p>
<p>Companytec offers three types of communication protocols: CBC, Companytec, and Horustech.</p>
<p>The CBC protocol was developed for use with older automation models—specifically, the CBC series.</p> These models were manufactured in a series ranging from CBC01 to CBC06; production of the latter ceased around 2012. Following that year, Companytec began manufacturing the Horustech models. This shift necessitated the creation of a new protocol—the Horustech protocol—which featured a different syntax and greater robustness, effectively resolving issues present in the previous version.</p>
<p>This transition presented Companytec with a dilemma: since a new protocol had been introduced, it was not feasible to require software developers to adopt it exclusively, as doing so would have caused significant disruption—forcing them to rewrite their entire codebase to accommodate the new model. Consequently, a third protocol was developed: the "Companytec" protocol. This is essentially the syntax of the original CBC protocol, adapted for use with more recent models, namely the Horustech and Concept lines.</p>
<p>In summary: if you intend to develop software that supports all automation models (CBC, Horustech, and Concept), you may use the CBC/Companytec protocol. If, however, your goal is to support only the most recent automation systems (Horustech and Concept), you can develop your software using the Horustech protocol.</p>
<p>Now that we have covered the types of protocols and automation systems offered by Companytec, let us take a closer look at the Concept system.</p>
<p>Concept is Companytec’s most current automation model. Beyond managing fuel dispensers, it also handles tank gauging and environmental monitoring.</p>
<p>As mentioned above, the Concept system supports both the CBC/Companytec and Horustech protocols. It communicates in the same manner as other Companytec automation models—via a socket connection using an IP address and port—so, during installation, it will not be... ...no changes to your software are required.</p>
<p>For communication regarding tank gauging and environmental monitoring, Concept utilizes the TLS-350 protocol. To establish a connection, simply open a socket connection to its IP address on port 10002; this communication process is identical to that used for fuel dispenser automation, albeit on a different port.</p>
<p>Regarding the TLS-350 protocol, the automation system supports only a subset of the available commands. The commands implemented in Concept are listed below:</p>

* i201 : TANK_STATUS;
* i202 : DELIVERY_REPORT_LIST;
* i20C : DELIVERY_REPORT;
* i205 : TANK_ALARMS_STATUS;
* i206 : TANK_ALARMS_REPORT;
* i301 : LEAK_SENSOR_STATUS;
* i302 : LEAK_SENSOR_REPORT;

</details>
