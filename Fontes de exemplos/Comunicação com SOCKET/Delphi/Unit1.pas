unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ScktComp, ALed, StdCtrls, Mask, ExtCtrls, ComCtrls, jpeg;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    SocketConnect: TButton;
    Label1: TLabel;
    ClientSocket1: TClientSocket;
    ledLan: ThhALed;
    Timer1: TTimer;
    RichEdit1: TRichEdit;
    Shape1: TShape;
    Label2: TLabel;
    Image1: TImage;
    Label3: TLabel;
    procedure SocketConnectClick(Sender: TObject);
    Function SocketOpen(b:boolean):boolean;
    Function AjustaRelogio(a:boolean):boolean;
    Function SendLan(comando:string;timeout:integer):string;
    Function ReceiveLanData(timeout:integer):string;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  DataLan: string;
  fl_cmd:byte;

implementation

{$R *.DFM}

procedure TForm1.SocketConnectClick(Sender: TObject);
begin
if SocketConnect.Caption='Conectar' then
    begin
    ClientSocket1.Address:=MaskEdit1.Text;
    ClientSocket1.Port:=2001;
    ClientSocket1.Active:=true;
    if SocketOpen(true)=false then
        messagedlg('Falha ao conectar em ' + ClientSocket1.Address,mterror,[mbok],0)
    else
        begin
        SocketConnect.Caption:='Desconectar';
        if (AjustaRelogio(true)) then
            begin
            ledLan.Value:=true;
            timer1.Enabled:=true;
            end
        else
            messagedlg('Falha ao sincronizar relógio: ' + ClientSocket1.Address,mterror,[mbok],0)
        end;
    end
else
    begin
    ClientSocket1.Active:=false;
    if SocketOpen(false) then
        begin
        SocketConnect.Caption:='Conectar';
        LedLan.Value:=ClientSocket1.Active;
        end;
    end;
end;

Function TForm1.SocketOpen(b:boolean):boolean;
var tentativas:byte;
begin
tentativas:=0;
while (ClientSocket1.Active<>b) and (tentativas<101) do
    begin
    application.ProcessMessages;
    inc(tentativas);
    sleep(1);
    end;
if ClientSocket1.Active=b then
    result:=true
else
    result:=false;
end;

Function TForm1.AjustaRelogio(a:boolean):boolean;
var st,rta:string;
    tentativas:byte;
begin
st:='(&H' + formatdatetime('ddhhmm',now) + ')';
tentativas:=1;
while (rta<>'(&H)') and (tentativas<10) do
    begin
    if ClientSocket1.Active then rta:=SendLan(st,2000);
    inc(tentativas);
    end;
if rta<>'(&H)' then
    result:=false
else
    result:=true;
end;

// -----------------------------------------------------------------------------
Function TForm1.SendLan(comando:string;timeout:integer):string;
var rta:string;
begin
if ClientSocket1.Active then
    begin
    ClientSocket1.Socket.SendText(comando);
    RichEdit1.Lines.Add('(' + ClientSocket1.Address + ') Comando : ' + comando);
    rta:=ReceiveLanData(timeout);
    if (rta<>'') then
        RichEdit1.Lines.Add('(' + ClientSocket1.Address + ') Resposta: ' + rta)
    else
        RichEdit1.Lines.Add('(' + ClientSocket1.Address + ') Sem Resposta');
    end;
result:=rta;
end;

// -----------------------------------------------------------------------------
Function TForm1.ReceiveLanData(timeout:integer):string;
var DataLen:integer;
    DataOut:string;
    start,stop:single;
    a:byte;
    Last:char;
begin
start:=gettickcount;
stop:=start + timeout;
Last:=#0;
while (start<stop) and (Last<>')')do
    begin
    start:=gettickcount;
    DataLan:=DataLan + ClientSocket1.Socket.ReceiveText;
    if (Length(DataLan)<>0) then
        Last:=DataLan[length(datalan)];
    end;
DataLen:=length(dataLan);
if (DataLan<>'') and (DataLan[length(DataLan)]=')') then
    begin
    if DataLen<>0 then
        begin
        DataOut:='';
        for a:=1 to DataLen do
            begin
            DataOut:=DataOut + DataLan[a];
            if (DataLan[a]='(') then
                begin
                    DataOut:='(';
                end
            else if (DataLan[a]=')') then
                begin
                DataLan:=copy(dataLan,a+1,length(dataLan));
                break;
                end;
            end;
        result:=DataOut;
        end
    else
        result:='';
    end
else
    result:='';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var comando,rta:string;
begin
if fl_cmd=0 then comando:='(&A)'
else if fl_cmd=1 then comando:='(&S)'
else if fl_cmd=2 then comando:='(&V)';
rta:=sendLan(comando,1000);
inc(fl_cmd);
if fl_cmd>2 then fl_cmd:=0;
end;



end.
