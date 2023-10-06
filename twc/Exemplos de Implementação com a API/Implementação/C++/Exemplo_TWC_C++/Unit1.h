//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Grids.hpp>
#include "TCPIP.h"
#include <Vcl.ExtCtrls.hpp>
#include <Data.DB.hpp>
#include <Vcl.DBCtrls.hpp>
#include <Vcl.Mask.hpp>
#include <Vcl.DBGrids.hpp>
#include <queue>
#include "Unit2.h"


#define VERSAO "2.0                 "
#define IP "192.168.0.77"

#define TOUTRX 50
#define TOUTTX 3
#define MAXERROR 10

#define TMAX 50
#define CMAX 200

#define LEN_CODCARD 16
#define MAX_LEN_NAME 45

#define TX 0
#define RX 1


#define ADMIN "A"

	typedef enum
	{
		CONNECT,
		RECONNECT,
		DISCONNECT,
		WAIT,
	}CONNECTION;

	typedef enum
	{
		CLIENTE,
		FROTA,
	}TERMINALMENU;

	typedef enum
	{
		STATE,
		LOOP,
	}TERMINAL;

	typedef enum
	{
		STX,
		INIT,
		GET_LEN,
		GET_DATA,
		GET_CHECK,
	}PROT_HRS;

	typedef enum
	{
		STATUS,
		PENDENCY,
		READVERSION,
		WRITEVERSION,
		WRITEMEN1,
		WRITEMEN2,
		WRITEMENA,
		WRITEMENB,
		WRITETELA,
		CHECKED,
		CANCELED,
		CLEAN,
		WRITECARDF,
		WRITEODO,
		WRITE_LOGIN,
		GET_CARD,
		WRITECPF,
		WRITEABAST,
		WRITEBICOBUSY,
		WRITEOLEO,
		WRITESENHA,
		WRITEBICO,
		WRITETAG,
		WRITEVALUE,
		WRITEABASTINIT,
		WRITEBICOOFF,
	}CMDS_SM;


using namespace std;
//---------------------------------------------------------------------------
typedef struct _PROT_ANALIZER_
{
	int Data_Count;
	AnsiString Ck;
	BYTE Ck_Count;
	char Ck_Acc[2];
	BYTE Sm;
	BYTE Len_Count;
	char Len_Acc[4];
	char Len_Aux[2];
	int Len;
	BYTE Checksum;
}_tPROT;

extern _tPROT Prot;
//---------------------------------------------------------------------------
class Terminal
{
	public:
		Terminal(void);
		void ChangeConfig (void);
		void Task(void);
		bool Close(void);
		int Num;
		int List[99];
		int idx;
		BYTE Sm_Task;
		int Cont;
		bool is_closing;
		String VersaoMenu;
};
//---------------------------------------------------------------------------
class Cmd
{
		int Tx_Push;
		int Tx_Pop;
		BYTE Tx_Checksum;
		char Buff_Tx[200];
		int sm_state;
		int sm_back;
		int Menu;
		String Dados;
		bool Pckg_Ok;
		bool Pendency;
		bool Checked;
		int Error;
		bool Is_busy;
		struct
		{
			String It;
			String Op;
		}Before_Rec;
	public:
		int sm_task;
		Cmd(void);
		void AutPutBegin(void);
		void AutPut(String str);
		void AutPutFlush(void);
		void AutPutStr (String str);
		void Task (void);
		void Loop (void);
		String Parser(char *p, int len);
		void Parser_Term (String str);
		int Send_Status (void);
		void Send_Pendency (void);
		void Read_Version (void);
		void Write_Men1 (void);
		void Write_Men2 (void);
		void Write_MenA (void);
		void Write_MenB (void);
		int Extract_Term(String str);
		void Write_Version(void);
		void Write_Tela (void);
		void Write_Welcome (void);
		void Write_Cancel(void);
		void Write_Clean(void);
};
//---------------------------------------------------------------------------
class Str
{
	private:
		String Txt;
		//int Valor;
		//float Val;
	public:
		Str(String);
	   //	Str(int);
		//Str(float);
		//float ToFloat (void);
		//String ToString(void);
		String Ajuste_Len (char ch ,char side, int new_len);
		//String Value (void);
		//int Len(void);
};
//---------------------------------------------------------------------------
class Tick
{
	public:
		Tick(void);
		bool TickCompare (int val);
		int GetTick (void);
		int Count;
};

//---------------------------------------------------------------------------
class TCP : public TCP_COM
{
	BYTE Sm;
	public:
		bool Recept;
		TCP (void);
		void Task(void);
		void Verify_Error(void);
		Tick Tout;
		int Tx;
		int Rx;
		int Rx_Push;
		int ToutTx;
		int ToutRx;
		char Buff_Rx[200];
};
//---------------------------------------------------------------------------
class Grid
{
	public:
		Grid(void);
		bool Paused;
		int Line;
		TStringGrid *Grade;
};
//---------------------------------------------------------------------------
class Connection : TCP
{
	private:
		TEdit *Ip;
		TComboBox *Port;
		TButton *Connect_b;

		int Line_term;
		bool is_Connected;
		bool Reconnecting;
		TIMEVAL Time;

	public:

		Grid Term;
		BYTE Sm;
		BYTE Sm_Task;
		void Write_term(String idx,String Cmd, String Cmd1, String Cmd2,String Cmd3);
		Connection (void);
		void ConnectClick (TObject *Sender);
		void Task (void);
		void Inc_Port (void);
		bool Connected (void);

};
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TStringGrid *StringGrid1;
	TTimer *T_Task;
	TGroupBox *GroupBox1;
	TButton *Button1;
	TComboBox *ComboBox2;
	TLabel *Label1;
	TLabel *Label2;
	TEdit *Edit1;
	TGroupBox *GroupBox2;
	TLabeledEdit *L_F_Placa;
	TLabeledEdit *L_F_Odo;
	TLabeledEdit *L_F_CPF;
	TLabeledEdit *L_F_CardF;
	TLabeledEdit *L_F_Bico;
	TLabeledEdit *L_F_Óleo;
	TGroupBox *GroupBox3;
	TLabeledEdit *L_C_CardF;
	TLabeledEdit *L_C_Senha;
	TLabeledEdit *L_C_TagV;
	TLabeledEdit *L_C_CardC;
	TLabeledEdit *L_C_Bico;
	TLabeledEdit *L_C_Value;
	TButton *B_T_Paused;
	TButton *B_T_Clean;
	TGroupBox *GroupBox4;
	TLabel *Label3;
	TEdit *E_C_Versao;
	TButton *Button2;
	TLabel *Label4;
	TEdit *E_TCPOUTTX;
	TLabel *Label5;
	TEdit *E_TCPOUTRX;
	TLabel *Label6;
	TLabel *Label7;
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall T_TaskTimer(TObject *Sender);
	void __fastcall B_T_PausedClick(TObject *Sender);
	void __fastcall B_T_CleanClick(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
