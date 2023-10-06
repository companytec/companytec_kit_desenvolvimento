//---------------------------------------------------------------------------


#pragma hdrstop

#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "System.Classes.TPersistent"
#pragma resource "*.dfm"
TDataModule2 *DataModule2;
//---------------------------------------------------------------------------
__fastcall TDataModule2::TDataModule2(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDataModule2::DataSetProvider1GetTableName(TObject *Sender, TDataSet *DataSet, WideString &TableName)
{
TableName = "Colaboradores";
}
//---------------------------------------------------------------------------

void __fastcall TDataModule2::DataModuleCreate(TObject *Sender)
{
	 try
	 {
		 MySQLConnection->Connected = false;
		 //MySQLConnection->LoadParamsFromIniFile(ExtractFilePath( ExeName + "dbxconnecitions.ini"));
		 MySQLConnection->Connected = true;
	 }
	 catch (...)
	 {
		//Show ( "Erro ao conectar base de dados. Verifique!");
		//   Terminate;
	 }
}
//---------------------------------------------------------------------------

void __fastcall TDataModule2::DataModuleDestroy(TObject *Sender)
{
	MySQLConnection->Connected = false;
}
//---------------------------------------------------------------------------


