unit atc;

interface

uses sysutils,dllcompanytec,math,dialogs;


function strToATCInventory(st:string):TInventory;
function IEEEtoDec(st:string):double;

implementation

uses io;

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// strToATCInventory
//       YYMMDDHHmmttpssssNNA       B       C       D       E       F       G
// i201011308121735010000007468B2686468A8EC5453C0950430E483C????????41975D6000000000&&EE76
// i201011308130850010000007468B27C3468AFB03453BFF6D430E496D????????4184639600000000&&EE48

// 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567
// 0        1         2         3         4         5         6         7         8
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function strToATCInventory(st:string):TInventory;
var a,NV,TCV:double;
begin
try
  strToATCInventory.FullString:=st;
  strToATCInventory.Calendario:=copy(st,13,2) + ':' + copy(st,15,2) + ' ' + copy(st,11,2) + '/' + copy(st,9,2) + '/' + copy(st,7,2);
  strToATCInventory.Tanque:=copy(st,17,2);
  strToATCInventory.Produto:=st[19];
  NV:=IeeeToDec(copy(st,26,8));
  strToATCInventory.Volume:=formatfloat('0.0',NV);
  TCV:=IeeeToDec(copy(st,34,8));
  strToATCInventory.TCVolvume:=formatfloat('0.0',TCV);
  strToATCInventory.Ullage:=formatfloat('0.0',IeeeToDec(copy(st,42,8)));           // Ullage
  strToATCInventory.Heigth:=formatfloat('0.0',IeeeToDec(copy(st,50,8)));           // Height
  if copy(st,58,8)<>'????????' then
    strToATCInventory.Water:=formatfloat('0.0',IeeeToDec(copy(st,58,8)))           // Water
  else
    strToATCInventory.Water:='0';
  a:=IeeeToDec(copy(st,66,8));
  strToATCInventory.Temperatura:=floattostr(a);       // Temperature
  strToATCInventory.WaterVolume:=formatfloat('0.0',IeeeToDec(copy(st,74,8)));      // Water volume
except
  on e:exception do strToATCInventory.FullString:=e.Message;
end;
end;

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Dectobin(valor: integer): string;
var binario: string;
begin
while valor >= 1  do
  begin
  binario:=inttostr(valor mod 2)+binario;
  valor:=(valor div 2);
  end;
while length(binario)<32 do binario:='0'+binario;
result:=binario;
end;

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BinToDec(Value: string): Integer;
var
i, iValueSize: Integer;
begin
Result := 0;
iValueSize := Length(Value);
for i := iValueSize downto 1 do
if Value[i] = '1' then Result := Result + (1 shl (iValueSize - i));
end;

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function IEEEtoDec(st:string):double;
var a:string; //temp
    S,E,M:double;
    exp,res:double; //man1
    man:double;
begin
a:=dectobin(strtoint('$' + st));
S:=strtoint(a[1]);
E:=bintodec(copy(a,2,8));
M:=bintodec(copy(a,10,23));
exp:=power(2,(E-127));
man:=(M / 8.388608)/1000000;
man:=man + 1;
res:=exp*man;
if S=1 then res:=res*-1;
//messagedlg('IEEtoDec:' + st + '=' +floattostr(res),mtinformation,[mbok],0);
result:=res;
end;



end.


