unit dllcompanytec;

interface

uses Windows;

Type
  teste = record
    v1: double;
    v2: double;
    bool: boolean;
    a: string[2];
    b: string[2];
    c: string[2];
  end;

type
  FoxString = record
    st: string[4];
  end;

Type
  Abast = record
    value: boolean;
    total_dinheiro: currency;
    total_litros: double;
    PU: currency;
    tempo: string[8];
    canal: string[2];
    data: string[10];
    hora: string[5];
    st_full: string[55];
    registro: integer;
    encerrante: real;
    integridade: boolean;
    checksum: boolean;
  end;

Type
  AbastVB = record
    registro: integer;
    value: boolean;
    integridade: boolean;
    checksum: boolean;
    encerrante: double;
    total_dinheiro: double;
    total_litros: double;
    PU: double;
    tempo: string;
    canal: string;
    data: string;
    hora: string;
    st_full: string;
  end;

Type
  AbastFid = record
    value: boolean;
    total_dinheiro: currency;
    total_litros: double;
    PU: currency;
    tempo: string[8];
    canal: string[2];
    data: string[10];
    hora: string[5];
    st_full: string[75];
    registro: integer;
    encerrante: real;
    integridade: boolean;
    checksum: boolean;
    tag: string[16];
  end;

Type
  AbastFid2 = record
    value: boolean;
    total_dinheiro: currency;
    total_litros: double;
    PU: currency;
    tempo: string[8];
    canal: string[2];
    data: string[10];
    hora: string[5];
    st_full: string[87];
    registro: integer;
    encerrante: real;
    integridade: boolean;
    checksum: boolean;
    tag: string[16];
    tag2: string[16];
  end;

Type
  AbastPAF1 = record
    value: boolean;
    total_dinheiro: currency;
    total_litros: double;
    PU: currency;
    tempo: string[8];
    codbico: string[2];
    numbico: integer;
    numtanque: integer;
    voltanque: integer;
    codcombustivel: integer;
    seriecbc: integer;
    tipocbc: char;
    data: string;
    hora: string;
    st_full: string;
    registro: integer;
    encerranteI: double;
    encerranteF: double;
    integridade: boolean;
    checksum: boolean;
    tag1: string[16];
    tag2: string[16];
  end;

Type
  AbastPAF2 = record
    value: boolean;
    total_dinheiro: currency;
    total_litros: double;
    PU: currency;
    tempo: integer;
    codbico: string[2];
    numbico: integer;
    numtanque: integer;
    voltanque: integer;
    codcombustivel: integer;
    seriecbc: integer;
    tipocbc: char;
    datetime: TDatetime;
    st_full: string[123];
    registro: integer;
    encerranteI: double;
    encerranteF: double;
    integridade: boolean;
    checksum: boolean;
    tag1: string[16];
    tag2: string[16];
  end;

Type
  Abast2 = record
    value: string[1];
    total_dinheiro: string[6];
    total_litros: string[6];
    PU: string[4];
    tempo: string[8];
    canal: string[2];
    data: string[10];
    hora: string[5];
    st_full: string[55];
    registro: string[4];
    encerrante: string[10];
    integridade: string[1];
    checksum: string[1];
  end;

Type
  Abast3 = record
    value: string[1];
    total_dinheiro: string[6];
    total_litros: string[6];
    PU: string[4];
    tempo: string[8];
    canal: string[2];
    data: string[10];
    hora: string[5];
    st_full: string[75];
    registro: string[4];
    encerrante: string[10];
    id: string[16];
    integridade: string[1];
    checksum: string[1];
  end;

Type
  IFid = record
    value: boolean;
    Codigo: string[16];
    Endereco: string[2];
    Dia: string[2];
    hora: string[2];
    Minuto: string[2];
    Mes: string[2];
    registro: integer;
    Status: boolean;
    StFull: string[37];
  end;

Type
  VBOnLine = record
    bico: array [1 .. 48] of string;
    volume: array [1 .. 48] of double;
  end;

Type
  StFid = record
    Status: string[32];
  end;

Type
  StStatus2 = record
    Posicao: array [1 .. 48] of string[20];
  end;

Type
  stPPL = record
    bico: string[2];
    PPL: string[4];
  end;

Type
  stEncerrante = record
    bico: string[2];
    encerrante: string[8];
  end;

type
  visualizacao = record
    StFull: string[250];
  end;

type
  StStatus = record
    value: string[100];
  end;

type
  Retorno = record
    value: string[100];
  end;

type
  Retorno2 = record
    value: string[60];
  end;

Type
  Virgula = record
    ptotal: byte;
    ppu: byte;
    litragem: byte;
  end;

type
  info = record
    titulo: string[20];
    versao: string[5];
    data: string[10];
    autor: string[20];
  end;

  Error = (ErroString, None, ErroCodBico, ErroCaracterModo, ErroTimeout, ErroResposta);
  StOptions = (Livre, Pronta, Falha, Concluiu, Abastecendo, Bloqueada, SolicitaLib);

  MultiStatus = record
    Status: array [1 .. 48] of StOptions;
  end;

  Online = record
    litragem: array [1 .. 48] of real;
    bico: array [1 .. 48] of string[2];
  end;

  encerrante = record
    bico: string[2];
    Valor: real;
  end;

  canal = record
    canal: array [1 .. 48] of byte;
    PuAux: array [1 .. 48] of double;
  end;

  Enc = record
    bico: string[2];
    tipo: string[1];
    Valor: string[8];
  end;

{$IFNDEF COMPANYTEC}


Function NET_StopPump(bico: WideString):integer;stdcall;
Function NET_AutoPump (bico: WideString ):integer;stdcall;
Function NET_FreePump(bico: WideString):integer;stdcall;
Function NET_BlockPump (bico:WideString):integer;stdcall;
function C_BlockPump(bico:pchar):integer; stdcall;
Function C_GetClock:PAnsiChar;stdcall;
Function C_SetClock(par:AnsiString):boolean;stdcall;
function getclock:string; stdcall;
Function GetIdentTag:shortstring; stdcall;
Function LeEncerrante2(modo:pchar;bico:shortstring ):shortstring;stdcall;
function C_ReadTotalsCash2(bico: byte): pchar; stdcall;
function C_ReadTotalsVolume3(bico: byte): pchar; stdcall;
Function SendReceiveText(var st: string; timeout: integer): integer; stdcall;
function TxRxSerial(comando: string; timeout: cardinal): pchar; stdcall;
function GetVisualizacao: shortstring; stdcall;
function GetVisualizacaoId: shortstring; stdcall;
function Connected: boolean; stdcall;
function GetEncerrante(bico: string; tipo: char): shortstring; stdcall;
function GetRegistro(nreg: integer): shortstring; stdcall;
Function saveTagFid(controle1, controle2: char; tag, t1in, t1out, t2in, t2out: string): integer; stdcall;
function GetAbastecimento: shortstring; stdcall;
function GetAbastecimentoIdent: shortstring; stdcall;
function GetAbastecimento2Ident: shortstring; stdcall;
Function InicializaSerial(np: byte): boolean; stdcall;
Function InicializaSocket(ip: ansistring): boolean; stdcall;
Function AlteraPreco(bico: string; preco: double; decimais: byte): Error; stdcall;
Function SetPrice(bico: byte; preco: double; decimais: byte): Error; stdcall;
Function AutoLibera(bico: string): Error; stdcall;
Function AutorizaAbast(bico: string): Error; stdcall;
Function BloqueiaBico(bico: string): Error; stdcall;
Function CobAlteraPreco(a: shortstring): Error; stdcall;
Procedure CobLeEnc(var a: Enc); stdcall;
Function CobLePPL(var a: shortstring): Error; stdcall;
Procedure CobLeStructSt(var ab: Abast2); stdcall;
Procedure CobLeVis(var st: visualizacao); stdcall;
Function CobPreset(a: shortstring): Error; stdcall;
Function CobSetClock(par: shortstring): boolean; stdcall;
Function Comunica: boolean; stdcall;
Function ConsultaEncerrante(modo: AnsiChar; bico: string): encerrante; stdcall;
Function EnviaComando(comando: string; timeout: cardinal): shortstring; stdcall;
Procedure EscreveSocket(desc, comando: string); stdcall;
Function FechaSerial: DWORD; stdcall;
Function FechaSocket: boolean; stdcall;
Function FechaSerialVB: boolean; stdcall;
Function LeEvento(indice: integer): shortstring; stdcall;
Function FidAciona(Endereco: string; minutos, segundos: byte): integer; stdcall;
Function FidIdent: IFid; stdcall;
Procedure FidIncrementa; stdcall;
Function FidLeRegistro(nro: integer): shortstring; stdcall;
Function FidModo(Endereco: string; option: char): integer; stdcall;
Function FidSetClock(Dia, hora, Minuto: byte): integer; stdcall;
Function FidStatus: StFid; stdcall;
Procedure Incrementa; stdcall;
Function InicializaLogSerial(np: byte; LogFile: string): boolean; stdcall;
Function LeAbastecimento(): Abast; stdcall;
Function LeAbastecimentoPAF1(): AbastPAF1; stdcall;
Function LeAbastecimentoPAF2: AbastPAF2; stdcall;
Function LeAbFix(): Abast; stdcall;
Function LePart(option: char): shortstring; stdcall;
Function LePPL(bico: string): real; stdcall;
Function LeRegistro(NumReg: integer): Abast; stdcall;
Function LeRegistroFid(NumReg: integer): AbastFid; stdcall;
procedure ConfigFid(canal, Endereco: integer); stdcall;
procedure DesconfigFid(canal, Endereco: integer); stdcall;
Function LeSocket(desc: string; timeout: cardinal): shortstring; stdcall;
Function LeStatus(): MultiStatus; stdcall;
Function LeStatusVB(): StStatus2; stdcall;
Function LeSTEncerrante(modo: string; bico: string): shortstring; stdcall;
Function LeStReduzida: shortstring; stdcall;
Function LeStRegistro(NumReg: integer): shortstring; stdcall;
Function LeStRegistroFid(NumReg: integer): shortstring; stdcall;
Function LeStringAb(var resposta: shortstring): shortstring; stdcall;
Function LeStringAbVB: shortstring; stdcall;
Function LeStructEncerrante(modo: string; bico: string): stEncerrante; stdcall;
Function LeStructPPL(bico: string): stPPL; stdcall;
Procedure LeStructSt(var ab: Abast2); stdcall;
Function LeStStatus: StStatus; stdcall;
Function LeVisualizacao(): Online; stdcall;
Procedure LimpaSerial; stdcall;
Function ParaBomba(bico: string): Error; stdcall;
Function LeStStatus2: shortstring; stdcall;
Function PortOpen: boolean; stdcall;
Function SocketOpen: boolean; stdcall;
Function deleteTagFid(Posicao: integer; tag: string): integer; stdcall;
Function Preset(bico: string; Valor: double): Error; stdcall;
Function ReadSerial(timeout: integer): shortstring; stdcall;
Procedure RefAltPreco(bico: string; preco: double; decimais: byte; var Status: Error); stdcall;
Procedure RefAutoLibera(bico: string; var Status: Error); stdcall;
Procedure RefAutorizaAbast(bico: string; var Status: Error); stdcall;
Procedure RefBloqueiaBico(bico: string; var Status: Error); stdcall;
Procedure RefEncerrante(bico: string; modo: char; var value: shortstring); stdcall;
Procedure RefLePPL(bico: string; var value: shortstring); stdcall;
Procedure RefParaBomba(bico: string; var Status: Error); stdcall;
Procedure RefPreset(bico: string; Valor: double; var Status: Error); stdcall;
Function SetAlteraPreco(st: string): boolean; stdcall;
Function SetAutoLibera(bico: string): boolean; stdcall;
Function SetAutorizaAbast(bico: string): boolean; stdcall;
Function SetBloqueiaBico(bico: string): boolean; stdcall;
Function SetClock(par: string): boolean; stdcall;
Function LeStatusFid(): MultiStatus; stdcall;
Function SetIntClock(Dia, hora, Minuto: byte): boolean; stdcall;
Function SetParaBomba(bico: string): boolean; stdcall;
Function SetPreset(st: string): boolean; stdcall;
Function STRefAltPreco(par: shortstring): integer; stdcall;
Function STVisualizacao(var visualizacao: shortstring): shortstring; stdcall;
Procedure VBLePPL(var inf: shortstring); stdcall;
procedure VBSetAutoLibera(var bico: string); stdcall;
procedure VBSetAutorizaAbast(var bico: string); stdcall;
procedure VBSetBloqueiaBico(var bico: string); stdcall;
Procedure VBSetPPL(var inf: string); stdcall;
Procedure Ver(var versao: info); stdcall;
Procedure WriteSerial(comando: string; len: integer); stdcall;
Function LeAbastecimentoFid: AbastFid; stdcall;
Function LeAbastecimentoFid2: AbastFid2; stdcall;
Procedure CobLeStructIDSt(var ab: Abast3); stdcall;
function readTagFid(indice: integer; var tag, controle, t1in, t1out, t2in, t2out: string): integer; stdcall;
procedure clearTagFid; stdcall;
procedure ShowTerminal; stdcall;
Function LeAbFidFix: AbastFid; stdcall;
Function LeAbFid2Fix: AbastFid2; stdcall;
Procedure FidIncrementaAbast; stdcall;
Function HRSReadTAG(indice: integer; var tag: ansistring; var level: integer): integer; stdcall;

{$ENDIF}

implementation

{$IFNDEF COMPANYTEC}

Function NET_StopPump; external 'COMPANYTEC.DLL' name 'NET_StopPump';
Function NET_AutoPump; external 'COMPANYTEC.DLL' name 'NET_AutoPump';
Function NET_FreePump; external  'COMPANYTEC.DLL' name 'NET_FreePump';
Function NET_BlockPump; external 'COMPANYTEC.DLL' name 'NET_BlockPump';
Function C_BlockPump; external 'COMPANYTEC.DLL' name 'C_BlockPump';
Function C_GetClock; external 'COMPANYTEC.DLL' name 'C_GetClock';
Function C_SetClock; external 'COMPANYTEC.DLL' name 'C_SetClock';
Function getclock; external 'COMPANYTEC.DLL' name 'getclock';
Function GetIdentTag; external 'COMPANYTEC.DLL' name 'GetIdentTag';
Function LeEncerrante2; external 'COMPANYTEC.DLL' name  'LeEncerrante2';
Function C_ReadTotalsCash2; external 'COMPANYTEC.DLL' name 'C_ReadTotalsCash2';
Function C_ReadTotalsVolume3; external 'COMPANYTEC.DLL' name 'C_ReadTotalsVolume3';
Function HRSReadTAG; external 'COMPANYTEC.DLL' name 'HRSReadTAG';
Procedure FidIncrementaAbast; external 'COMPANYTEC.DLL' name 'FidIncrementaAbast';
function Connected; external 'COMPANYTEC.DLL' name 'Connected';
procedure clearTagFid; external 'COMPANYTEC.DLL' name 'clearTagFid';
function TxRxSerial; external 'COMPANYTEC.DLL' name 'TxRxSerial';
procedure ConfigFid; external 'COMPANYTEC.DLL' name 'ConfigFid';
procedure DesconfigFid; external 'COMPANYTEC.DLL' name 'DesconfigFid';
function readTagFid; external 'COMPANYTEC.DLL' name 'readTagFid';
Function SendReceiveText; external 'COMPANYTEC.DLL' name 'SendReceiveText';
procedure ShowTerminal; external 'COMPANYTEC.DLL' name 'ShowTerminal';
Function InicializaSerial; external 'COMPANYTEC.DLL' name 'InicializaSerial';
Function InicializaSocket; external 'COMPANYTEC.DLL' name 'InicializaSocket';
Function AlteraPreco; external 'COMPANYTEC.DLL' name 'AlteraPreco';
Function LeAbastecimentoFid; external 'COMPANYTEC.DLL' name 'LeAbastecimentoFid';
Function LeAbastecimentoFid2; external 'COMPANYTEC.DLL' name 'LeAbastecimentoFid2';
Function LeStatus; external 'COMPANYTEC.DLL' name 'LeStatus';
Function saveTagFid; external 'COMPANYTEC.DLL' name 'saveTagFid';
Function AutoLibera; external 'COMPANYTEC.DLL' name 'AutoLibera';
Function AutorizaAbast; external 'COMPANYTEC.DLL' name 'AutorizaAbast';
Function BloqueiaBico; external 'COMPANYTEC.DLL' name 'BloqueiaBico';
Function CobAlteraPreco; external 'COMPANYTEC.DLL' name 'CobAlteraPreco';
Procedure CobLeEnc; external 'COMPANYTEC.DLL' name 'CobLeEnc';
Function CobLePPL; external 'COMPANYTEC.DLL' name 'CobLePPL';
Procedure CobLeStructSt; external 'COMPANYTEC.DLL' name 'CobLeStructSt';
Procedure CobLeVis; external 'COMPANYTEC.DLL' name 'CobLeVis';
Function CobPreset; external 'COMPANYTEC.DLL' name 'CobPreset';
Function CobSetClock; external 'COMPANYTEC.DLL' name 'CobSetClock';
Function Comunica; external 'COMPANYTEC.DLL' name 'Comunica';
Procedure CobLeStructIDSt; external 'COMPANYTEC.DLL' name 'CobLeStructIDSt';
Function ConsultaEncerrante; external 'COMPANYTEC.DLL' name 'ConsultaEncerrante';
Function EnviaComando; external 'COMPANYTEC.DLL' name 'EnviaComando';
Procedure EscreveSerial; external 'COMPANYTEC.DLL' name 'EscreveSerial';
Procedure EscreveSocket; external 'COMPANYTEC.DLL' name 'EscreveSocket';
Function FechaSerial; external 'COMPANYTEC.DLL' name 'FechaSerial';
Function FechaSocket; external 'COMPANYTEC.DLL' name 'FechaSocket';
Function FechaSerialVB; external 'COMPANYTEC.DLL' name 'FechaSerialVB';
Function LeEvento; external 'COMPANYTEC.DLL' name 'LeEvento';
Function FidAciona; external 'COMPANYTEC.DLL' name 'FidAciona';
Function FidIdent: IFid; external 'COMPANYTEC.DLL' name 'FidIdent';
Function LeStStatus2: shortstring; external 'COMPANYTEC.DLL' name 'LeStStatus2';
Procedure FidIncrementa; external 'COMPANYTEC.DLL' name 'FidIncrementa';
Function FidLeRegistro; external 'COMPANYTEC.DLL' name 'FidLeRegistro';
Function FidModo; external 'COMPANYTEC.DLL' name 'FidModo';
Function SetPrice; external 'COMPANYTEC.DLL' name 'SetPrice';
Function FidSetClock; external 'COMPANYTEC.DLL' name 'FidSetClock';
Function FidStatus; external 'COMPANYTEC.DLL' name 'FidStatus';
Procedure Incrementa; external 'COMPANYTEC.DLL' name 'Incrementa';
Function InicializaLogSerial; external 'COMPANYTEC.DLL' name 'InicializaLogSerial';
Function LeAbastecimento; external 'COMPANYTEC.DLL' name 'LeAbastecimento';
Function LeAbastecimentoPAF1; external 'COMPANYTEC.DLL' name 'LeAbastecimentoPAF1';
Function LeAbastecimentoPAF2; external 'COMPANYTEC.DLL' name 'LeAbastecimentoPAF2';
Function LeAbFix; external 'COMPANYTEC.DLL' name 'LeAbFix';
Function LePart; external 'COMPANYTEC.DLL' name 'LePart';
Function LePPL; external 'COMPANYTEC.DLL' name 'LePPL';
Function LeRegistro; external 'COMPANYTEC.DLL' name 'LeRegistro';
Function LeRegistroFid; external 'COMPANYTEC.DLL' name 'LeRegistroFid';
Function LeSocket; external 'COMPANYTEC.DLL' name 'LeSocket';
Function LeStatusVB; external 'COMPANYTEC.DLL' name 'LeStatusVB';
Function LeSTEncerrante; external 'COMPANYTEC.DLL' name 'LeSTEncerrante';
Function LeStReduzida; external 'COMPANYTEC.DLL' name 'LeStReduzida';
Function LeStRegistro; external 'COMPANYTEC.DLL' name 'LeStRegistro';
Function LeStRegistroFid; external 'COMPANYTEC.DLL' name 'LeStRegistroFid';
Function LeStringAb; external 'COMPANYTEC.DLL' name 'LeStringAb';
Function LeStringAbVB; external 'COMPANYTEC.DLL' name 'LeStringAbVB';
Function LeStatusFid; external 'COMPANYTEC.DLL' name 'LeStatusFid';
Function LeStructEncerrante; external 'COMPANYTEC.DLL' name 'LeStructEncerrante';
Function LeStructPPL; external 'COMPANYTEC.DLL' name 'LeStructPPL';
Procedure LeStructSt; external 'COMPANYTEC.DLL' name 'LeStructSt';
Function LeStStatus; external 'COMPANYTEC.DLL' name 'LeStStatus';
Function LeVisualizacao; external 'COMPANYTEC.DLL' name 'LeVisualizacao';
Procedure LimpaSerial; external 'COMPANYTEC.DLL' name 'LimpaSerial';
Function ParaBomba; external 'COMPANYTEC.DLL' name 'ParaBomba';
Function PortOpen; external 'COMPANYTEC.DLL' name 'PortOpen';
Function SocketOpen; external 'COMPANYTEC.DLL' name 'SocketOpen';
Function Preset; external 'COMPANYTEC.DLL' name 'Preset';
Function ReadSerial; external 'COMPANYTEC.DLL' name 'ReadSerial';
Procedure RefAltPreco; external 'COMPANYTEC.DLL' name 'RefAltPreco';
Procedure RefAutoLibera; external 'COMPANYTEC.DLL' name 'RefAutoLibera';
Procedure RefAutorizaAbast; external 'COMPANYTEC.DLL' name 'RefAutorizaAbast';
Procedure RefBloqueiaBico; external 'COMPANYTEC.DLL' name 'RefBloqueiaBico';
Procedure RefEncerrante; external 'COMPANYTEC.DLL' name 'RefEncerrante';
Procedure RefLePPL; external 'COMPANYTEC.DLL' name 'RefLePPL';
Procedure RefParaBomba; external 'COMPANYTEC.DLL' name 'RefParaBomba';
Procedure RefPreset; external 'COMPANYTEC.DLL' name 'RefPreset';
Function SetAlteraPreco; external 'COMPANYTEC.DLL' name 'SetAlteraPreco';
Function SetAutoLibera; external 'COMPANYTEC.DLL' name 'SetAutoLibera';
Function SetAutorizaAbast; external 'COMPANYTEC.DLL' name 'SetAutorizaAbast';
Function SetBloqueiaBico; external 'COMPANYTEC.DLL' name 'SetBloqueiaBico';
Function SetClock; external 'COMPANYTEC.DLL' name 'SetClock';
Function SetIntClock; external 'COMPANYTEC.DLL' name 'SetIntClock';
Function SetParaBomba; external 'COMPANYTEC.DLL' name 'SetParaBomba';
Function SetPreset; external 'COMPANYTEC.DLL' name 'SetPreset';
Function STRefAltPreco; external 'COMPANYTEC.DLL' name 'STRefAltPreco';
Function STVisualizacao; external 'COMPANYTEC.DLL' name 'STVisualizacao';
Procedure VBLePPL; external 'COMPANYTEC.DLL' name 'VBLePPL';
procedure VBSetAutoLibera; external 'COMPANYTEC.DLL' name 'VBSetAutoLibera';
procedure VBSetAutorizaAbast; external 'COMPANYTEC.DLL' name 'VBSetAutorizaAbast';
procedure VBSetBloqueiaBico; external 'COMPANYTEC.DLL' name 'VBSetBloqueiaBico';
Procedure VBSetPPL; external 'COMPANYTEC.DLL' name 'VBSetPPL';
Procedure Ver; external 'COMPANYTEC.DLL' name 'Ver';
Procedure WriteSerial; external 'COMPANYTEC.DLL' name 'WriteSerial';
function GetAbastecimento; external 'COMPANYTEC.DLL' name 'GetAbastecimento';
function GetAbastecimentoIdent; external 'COMPANYTEC.DLL' name 'GetAbastecimentoIdent';
function GetAbastecimento2Ident; external 'COMPANYTEC.DLL' name 'GetAbastecimento2Ident';
function GetEncerrante; external 'companytec.dll' name 'GetEncerrante';
function GetRegistro; external 'companytec.dll' name 'GetRegistro';
function deleteTagFid; external 'companytec.dll' name 'deleteTagFid';
function GetVisualizacao; external 'companytec.dll' name 'GetVisualizacao';
function GetVisualizacaoId; external 'companytec.dll' name 'GetVisualizacaoId';
Function LeAbFidFix; external 'companytec.dll' name 'LeAbFidFix';
Function LeAbFid2Fix; external 'companytec.dll' name 'LeAbFid2Fix';
{$ENDIF}

end.
