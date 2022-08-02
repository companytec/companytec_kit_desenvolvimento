unit fid;

interface

uses companytec;

implementation

//----------------------------------------------------------------------------------------------------------------------
//
//      Funções IDENTFID
//
//----------------------------------------------------------------------------------------------------------------------
Function FidIdent(var resposta:string):string;
var
    comando:string;
begin
comando:=AdicionaCheck('(?A');
EscreveSerial('LeFidIdent',comando);
resposta:=LeSerial('LeFidIdent',1000);
result:=resposta;
end;

Procedure FidIncrementa;
begin
EscreveSerial('IncrementaFid',AdicionaCheck('(?I'));
end;

Function FidStatus(var resposta:string):string;
var
    comando:string;
begin
comando:=AdicionaCheck('(?S');
EscreveSerial('LeFidStatus',comando);
resposta:=LeSerial('LeFidStatus',1000);
result:=resposta;
end;

Function FidModo(endereco:string;option:char):integer;
var
    resposta,comando:string;
begin
comando:=AdicionaCheck('(?M' + endereco + option);
EscreveSerial('FidModo',comando);
resposta:=LeSerial('FidModo',800);
if resposta='(M' + endereco + ')' then  result:=1       // 1- comando Ok
else if resposta='(M?t)' then result:=2                 // 2- erro timeout
else if resposta='(M?b)' then result:=3                 // 3- erro endereco
else if resposta='(M?m)' then result:=4                 // 4- erro caracter modo
else result:=0;                                         // 0- erro desconhecido
end;

Function FidAciona(endereco:string;minutos,segundos:byte):integer;
var
    stminuto,stsegundo:string[2];
    comando,resposta:string;
begin
if minutos<10 then stminuto:='0' + inttostr(minutos) else stminuto:=inttostr(minutos);
if segundos<10 then stsegundo:='0' + inttostr(segundos) else stsegundo:=inttostr(segundos);
if length(endereco)<2 then endereco:='0' + endereco;
comando:=AdicionaCheck('(?P' + endereco + stminuto + stsegundo);
EscreveSerial('FidAciona',comando);
resposta:=LeSerial('FidAciona',800);
if resposta='(P' + endereco + ')' then  result:=1       // 1- comando Ok
else if resposta='(P?t)' then result:=2                 // 2- erro timeout
else if resposta='(P?b)' then result:=3                 // 3- erro endereco
else if resposta='(P?m)' then result:=4                 // 4- erro caracter modo
else result:=0;                                         // 0- erro desconhecido
end;

Function FidSetClock(dia,hora,minuto:byte):integer;
var
    stdia,sthora,stminuto:string[2];
    comando,resposta:string;
begin
if dia<10 then stdia:='0' + inttostr(dia) else stdia:=inttostr(dia);
if hora<10 then sthora:='0' + inttostr(hora) else sthora:=inttostr(hora);
if minuto<10 then stminuto:='0' + inttostr(minuto) else stminuto:=inttostr(minuto);
comando:=AdicionaCheck('(?H' + stdia + sthora + stminuto);
EscreveSerial('FidSetClock',comando);
resposta:=LeSerial('FidSetClock',800);
if resposta='(%H)' then
    result:=1                                           // 1- comando Ok
else
    result:=0;                                          // 0- falha
end;

Function FidLeRegistro(nro:integer):string;
var
    stnro:string[4];
    resposta,comando:string;
begin
stnro:=inttostr(nro);
while length(stnro)<4 do stnro:='0' + stnro;
comando:=AdicionaCheck('(?LR' + stnro);
EscreveSerial('LeFidRegistro',comando);
resposta:=LeSerial('LeFidRegistro',1000);
result:=resposta;
end;


end.
