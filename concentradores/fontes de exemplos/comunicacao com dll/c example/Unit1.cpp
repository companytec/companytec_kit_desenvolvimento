//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include <cstdio>
#include <string>
#include <cstring>
#include <iostream>
#include <cctype>
#include <windows>
#include <stdlib.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;


typedef bool  (WINAPI *PCB)  ( const char*);
typedef char* (WINAPI *PSI)  ( char*);
typedef int   (WINAPI *PCI)  ( char*);
typedef int   (WINAPI *PII)  (int);
typedef int   (WINAPI *PVI)  (void);
typedef int   (WINAPI *PCCI) (char*, char*);
typedef char*   (WINAPI *PCCC) (char*, char*);
typedef char* (WINAPI *PVC)   (void);
typedef char* (WINAPI *PVC) (void);

    HINSTANCE hModule = NULL;
    PCB inicializaSocket = NULL;
    PSI testepchar =  NULL;
    PCI C_AutoPump = NULL;
    PCI C_BlockPump = NULL;
    PVI C_CloseSerial = NULL;
    PVI C_CloseSocket = NULL;
    PCI C_FreePump = NULL;
    PVI C_NextSale = NULL;
    PII C_OpenSerial = NULL;
    PCI C_OpenSocket = NULL;
    PCCI C_PresetPump = NULL;
    PVC  C_GetSalePAF = NULL;
    PSI C_StopPump = NULL;
    PCCC C_SetPrice = NULL;
    PCI  C_ReadTotalsCash = NULL;
    PCI  C_ReadTotalsVolume = NULL;
    PVC C_readState = NULL;
    PVC C_GetClock = NULL;

//---------------------------------------------------------------------------


bool loadLibrary()
{

    // load library
    hModule =  LoadLibrary(TEXT("companytec.dll"));
    if(hModule != NULL)
    {
        inicializaSocket = (PCB) GetProcAddress(hModule, "InicializaSocket");
        C_AutoPump = (PCI) GetProcAddress(hModule,"C_AutoPump");
        C_BlockPump = (PCI) GetProcAddress(hModule,"C_BlockPump");
        C_CloseSerial = (PVI) GetProcAddress(hModule, "C_CloseSerial");
        C_CloseSocket = (PVI) GetProcAddress(hModule, "C_CloseSocket");
        C_FreePump = (PCI) GetProcAddress(hModule, "C_FreePump");
        C_NextSale = (PVI) GetProcAddress(hModule, "C_NextSale");
        C_OpenSerial = (PII) GetProcAddress(hModule, "C_OpenSerial");
        C_OpenSocket = (PCI) GetProcAddress(hModule, "C_OpenSocket");
        C_PresetPump = (PCCI) GetProcAddress(hModule, "C_PresetPump");
        C_GetSalePAF  = (PVC) GetProcAddress(hModule, "C_GetSalePAF");
        C_StopPump = (PSI) GetProcAddress(hModule, "C_StopPump");
        C_SetPrice = (PCCC) GetProcAddress(hModule, "C_SetPrice");
        C_ReadTotalsCash = (PCI) GetProcAddress(hModule , "C_ReadTotalsCash");
        C_ReadTotalsVolume = (PCI) GetProcAddress(hModule, "C_ReadTotalsVolume");
        C_readState = (PVC) GetProcAddress(hModule, "C_readState");
        C_GetClock = (PVC) GetProcAddress(hModule, "C_GetClock");
        return true;
    } else{
        return false;
    }
}


//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------


void __fastcall TForm1::FormCreate(TObject *Sender)
{
        bool flag;

        try {
         flag = loadLibrary();
         if(flag)
         {
          ListBox1->Items->Add("Log:");
          ListBox1->Items->Add("Biblioteca carregada");
          //Edit7->Text = "192.168.0.95";
          ComboBox1->Items->Add("Autorizar Abastecimento");
          ComboBox1->Items->Add("Bloqueiar Abastecimento");
          ComboBox1->Items->Add("Liberar   Abastecimento");
          ComboBox1->Items->Add("Parar     Abastecimento");
         }
        }
        catch ( int e)
        {
           ListBox1->Items->Add(e);
        }
       //

}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{

        std::string str = "";
        if(Button1->Caption == "Conectar")
        {
                if(Edit7->Text != "")
                {
                      ListBox1->Items->Add(Edit7->Text);
                      if(C_OpenSocket(Edit7->Text.c_str()))
                      {
                                str = "Conected to ";
                                str +=  Edit7->Text.c_str();
                                ListBox1->Items->Add(str.c_str());
                                Button1->Caption= "Desconectar";
                      }
                }

        }else
        {
                if(C_CloseSocket())
                {
                    ListBox1->Items->Add("Conexão Encerrada");
                    Button1->Caption = "Conectar";
                }
        }

}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
        char *str =  new char[132];
        char * result = new char[124];
        strcpy(str, "RX: ");
        ListBox1->Items->Add("TX: Leitura Abastecimento PAF");
        result = C_GetSalePAF();
        if(strlen(result) > 1)
        {
                strcat(str, result);
                ListBox1->Items->Add(str);
                ListBox1->Items->Add(" ");
        }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button4Click(TObject *Sender)
{
        C_NextSale();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button5Click(TObject *Sender)
{
        AnsiString bico = Edit3->Text;
        AnsiString valor = Edit2->Text;
        if(bico.Length() == 2 && valor.Length() == 6)
        {
                if(C_PresetPump(bico.c_str(),valor.c_str()))
                {
                        ListBox1->Items->Add("Preset ok");
                }
        }


}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button9Click(TObject *Sender)
{
        int index;
        if(Edit4->Text.Length() == 2)
        {
                if(ComboBox1->ItemIndex != -1)
                {
                        index = ComboBox1->ItemIndex;
                        switch(index)
                        {
                                case 0:
                                        if(C_AutoPump(Edit4->Text.c_str()))
                                                ListBox1->Items->Add("Autorizado o Abastecimento do bico "+ Edit4->Text);
                                        break;
                                case 1:
                                        if(C_BlockPump(Edit4->Text.c_str()))
                                                ListBox1->Items->Add("Bloqueando o Abastecimento do bico " + Edit4->Text);
                                        break;
                                case 2:
                                        if(C_FreePump(Edit4->Text.c_str()))
                                                ListBox1->Items->Add("Liberando o Abastecimento do bico " + Edit4->Text);
                                        break;
                                case 3:
                                        if(C_StopPump(Edit4->Text.c_str()))
                                                ListBox1->Items->Add("Parando o Abastecimento do bico " + Edit4->Text);
                                        break;
                                default:
                                        ListBox1->Items->Add("Erro no comando de Modo");
                        }

                }else
                {
                        ListBox1->Items->Add("Comando de modo mal Formatado");
                }
        }else
        {
                ListBox1->Items->Add("Comando de modo mal Formatado");
        }
}
//---------------------------------------------------------------------------





void __fastcall TForm1::Button6Click(TObject *Sender)
{
        char number[33];
        char *str = new char[30];
        strcpy(str,"RX: ");
        if(Edit1->Text.Length() == 2)
        {
                  int a = C_ReadTotalsCash(Edit1->Text.c_str());
                  itoa(a,number,10);
                  strcat(str, number);
                  ListBox1->Items->Add("TX: Encerrante Valor");
                  ListBox1->Items->Add(str);

        }else
        {
                ListBox1->Items->Add("Comando mal formatado");
        }
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Button2Click(TObject *Sender)
{
        char *str =  new char[130];
        if(Edit5->Text.Length() == 2 && Edit6->Text.Length()==4)
        {
               ListBox1->Items->Add("TX: Alteração de preço");
               strcpy(str , "RX:");
               strcat(str, C_SetPrice(Edit5->Text.c_str(), Edit6->Text.c_str()) );
               ListBox1->Items->Add(str);
               ListBox1->Items->Add(" ");
        }else
        {
                ListBox1->Items->Add("RX:Comando Mal Formatado");
                 ListBox1->Items->Add(" ");
        }
}
//---------------------------------------------------------------------------



void __fastcall TForm1::Button8Click(TObject *Sender)
{
        if(Edit8->Text.Length() == 2)
        {
                  int a = C_ReadTotalsVolume(Edit8->Text.c_str());
                  ListBox1->Items->Add(a);

        }else
        {
                ListBox1->Items->Add("Comando mal formatado");
        }
}
//---------------------------------------------------------------------------


void __fastcall TForm1::Button10Click(TObject *Sender)
{
        char *str =  new char[30];
        strcpy(str,"RX:");
        strcat(str,C_GetClock());
        ListBox1->Items->Add("TX: Le calendario");

        ListBox1->Items->Add(str);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button7Click(TObject *Sender)
{
        char *str =  new char[100];
        char * result = new char[100];

        strcpy(str, "RX:");
        result = C_readState();
        strcat(str, result);
        ListBox1->Items->Add("TX: Leitura de STATUS");
        ListBox1->Items->Add(str);
}
//---------------------------------------------------------------------------

