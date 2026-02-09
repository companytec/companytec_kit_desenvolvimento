unit gets;

interface
  function GetAbastecimento:shortstring;stdcall;export;
  function GetAbastecimentoIdent:shortstring;stdcall;export;
  function GetAbastecimento2Ident:shortstring;stdcall;export;
  Function AdicionaCheck(STin:string):string;

implementation

uses  sysutils,
      io;

//------------------------------------------------------------------------------------------------------------
// Função AdicionaCheck                                                                                      -
// Entrada: String a ser adicionado o check                                                                  -
// Saída: String com o check ja adicionado                                                                   -
// Sub-Functions: None                                                                                       -
//------------------------------------------------------------------------------------------------------------
Function AdicionaCheck(STin:string):string;
var
  a,check:byte;
begin
  check:=0;
  for a:=2 to length(STin) do
    check:=check + ord(STin[a]);
  result:=STin + inttohex(check,2) + ')';
end;

function GetAbastecimento:shortstring;stdcall;export;
begin
  result:=Get('GetAbastecimento','(&A)',1000);
end;

function GetAbastecimentoIdent:shortstring;stdcall;export;
var
  comando:string;
begin
comando:=adicionacheck('(&A');
result:=Get('GetAbastecimentoIdent',comando,1000);
end;

function GetAbastecimento2Ident:shortstring;stdcall;export;
var comando:string;
begin
comando:=adicionacheck('(&@');
result:=Get('GetAbastecimentoIdent',comando,1000);
end;

end.
