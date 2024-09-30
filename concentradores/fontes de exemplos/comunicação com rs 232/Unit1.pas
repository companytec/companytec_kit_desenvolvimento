{Abaixo um exemplo prático de como enviar e receber comandos }

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CPort, ExtCtrls, Spin, ComCtrls, jpeg;

type
  TForm1 = class(TForm)
    RichEdit1: TRichEdit;
    Label3: TLabel;
    Shape1: TShape;
    Image1: TImage;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    SpinEdit1: TSpinEdit;
    Button4: TButton;
    Label5: TLabel;
    Panel1: TPanel;
    TxtComando: TEdit;
    Label2: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label6: TLabel;
    Label4: TLabel;
    Shape2: TShape;
    ComPort1: TComPort;
    Button1: TButton;
    Button9: TButton;
    procedure ButtonComandoClick(Sender: TObject);
    function EnviaComando(pedido:string):string;
    function check03(st_abast: string):boolean;
    function check01(st_abast: string):boolean;
    procedure FormCreate(Sender: TObject);
    procedure ComPort1AfterClose(Sender: TObject);
    procedure ComPort1AfterOpen(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    Function AdicionaCheck(st:string):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  str:string='';

implementation

{$R *.DFM}

procedure TForm1.ButtonComandoClick(Sender: TObject);
begin
if button4.Caption[1]='A' then
    begin
    comport1.Port:='COM' + inttostr(spinedit1.value);
    comport1.Open;
    end
else
    begin
    comport1.Close;
    end;
end;

Function TForm1.AdicionaCheck(st:string):string;
var a:byte;
    acumulador:byte;
begin
acumulador:=0;
for a:=1 to length(st) do
  acumulador:=acumulador + ord(st[a]);
result:='(' + st + inttohex(acumulador,2) + ')';
end;

function tForm1.EnviaComando(pedido:string):string;
var     part_ab: string[52];
        caractere:string;
        tempo,espera,fx:word;
begin
espera:=500;      // tempo da espera em milisegundos (timeout)
comport1.WriteStr(pedido);
tempo:=gettickcount;
fx:=0;
part_ab:='';
while ((tempo+espera)>fx) and (part_ab[length(part_ab)]<>')') do
        begin
        sleep(1);
        comport1.ReadStr(caractere,1);
        part_ab:=part_ab + caractere;
        fx:=gettickcount;
        end;
result:=part_ab;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
function tform1.check03(st_abast: string):boolean;
var
val_check: string;
a,check: integer;
begin
check:=0;
try
        for a:=2 to 49 do check:=check + ord(st_abast[a]);
        val_check:=inttohex(check,2);
        val_check:=copy(val_check,length(val_check)-1,2);
        if val_check=copy(st_abast,50,2) then
                result:=true
        else result:=false;
except
        result:=false;
        messagedlg('Erro Rotina comp_ab',mterror,[mbok],0);
end;
end;


// -----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
Function TForm1.check01(st_abast: string):boolean;
var check:byte;
    a:integer;
begin
a:=2;
check:=0;
while a<=31 do
    begin
    check:=check + strtoint('$' + copy(st_abast,a,2));
    a:=a+2;
    end;
if inttohex(check,2)=copy(st_abast,32,2) then
    result:=true
else
    result:=false;
end;

procedure TForm1.ComPort1AfterClose(Sender: TObject);
begin
button4.Caption:='Abre porta';
shape2.Brush.Color:=clred;
end;

procedure TForm1.ComPort1AfterOpen(Sender: TObject);
begin
button4.Caption:='Fecha porta';
shape2.Brush.Color:=cllime;
end;

procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var stparcial:string;
    a:byte;
begin
for a:=1 to count do
  begin
  comport1.ReadStr(stparcial,1);
  str:=str + stparcial;
  if stparcial='(' then
    str:='('
  else if stparcial=')' then
    Richedit1.Lines.Add(formatdatetime('hh:mm:ss',now) + ' Resposta : ' + str);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
comport1.WriteStr('(&A)');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
comport1.WriteStr('(&V)');
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
comport1.WriteStr('(&S)');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
comport1.WriteStr('(&H' + formatdatetime('ddhhmm',now) +')');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
comport1.WriteStr(txtcomando.text);
end;

procedure TForm1.Button9Click(Sender: TObject);
var st:string;
begin
st:=AdicionaCheck('&T' + combobox1.Text + combobox2.text[1]);
comport1.WriteStr(st);
end;

end.
