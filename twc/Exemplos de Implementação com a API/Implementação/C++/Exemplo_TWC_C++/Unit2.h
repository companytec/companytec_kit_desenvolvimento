//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <Data.DBXMySQL.hpp>
#include <Data.FMTBcd.hpp>
#include <Data.SqlExpr.hpp>
#include <Datasnap.DBClient.hpp>
#include <Datasnap.Provider.hpp>
//---------------------------------------------------------------------------
class TDataModule2 : public TDataModule
{
__published:	// IDE-managed Components
	TSQLConnection *MySQLConnection;
	TSQLQuery *SQLQuery1;
	TClientDataSet *ClientDataSet1;
	TDataSetProvider *DataSetProvider1;
	TIntegerField *SQLQuery1Id;
	TStringField *SQLQuery1Nome;
	TStringField *SQLQuery1CodCartao;
	TIntegerField *ClientDataSet1Id;
	TStringField *ClientDataSet1Nome;
	TStringField *ClientDataSet1CodCartao;
	TStringField *SQLQuery1Nivel;
	TStringField *ClientDataSet1Nivel;
	TSQLQuery *SQLQuery2;
	TIntegerField *IntegerField1;
	TStringField *StringField1;
	TStringField *StringField2;
	TStringField *StringField3;
	void __fastcall DataSetProvider1GetTableName(TObject *Sender, TDataSet *DataSet, WideString &TableName);
	void __fastcall DataModuleCreate(TObject *Sender);
	void __fastcall DataModuleDestroy(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TDataModule2(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDataModule2 *DataModule2;
//---------------------------------------------------------------------------
#endif
