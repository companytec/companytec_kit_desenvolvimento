unit data_types;

interface

Type
    Abast=record
        value           :boolean;
        total_dinheiro  :currency;
        total_litros    :double;
        PU              :currency;
        tempo           :string[8];
        canal           :string[2];
        data            :string[10];
        hora            :string[5];
        st_full         :string[55];
        registro        :integer;
        encerrante      :real;
        integridade     :boolean;
        checksum        :boolean;
        end;


Type
    AbastTWC=record
        value           :boolean;
        total_dinheiro  :currency;
        total_litros    :double;
        PU              :currency;
        tempo           :string[8];
        codbico         :string[2];
        numbico         :integer;
        numtanque       :integer;
        voltanque       :integer;
        codcombustivel  :integer;
        seriecbc        :integer;
        tipocbc         :char;
        data            :string[10];
        hora            :string[5];
        st_full         :string[123];
        registro        :integer;
        encerranteI     :double;
        encerranteF     :double;
        integridade     :boolean;
        checksum        :boolean;
        tag1            :string[16];
        tag2            :string[16];
        numbicopista    :integer;
        odometro        :integer;
        end;

Type
    Abast2=record
        value:string[1];
        total_dinheiro:string[6];
        total_litros:string[6];
        PU:string[4];
        tempo:string[8];
        canal:string[2];
        data:string[10];
        hora:string[5];
        st_full:string[55];
        registro:string[4];
        encerrante:string[10];
        integridade:string[1];
        checksum:string[1];
        end;

Type StStatus2=record
    Posicao: array [1..48] of string[10];
    end;

Type
    stPPL=record
        Bico:string[2];
        PPL:string[4];
    end;

Type
    stEncerrante=record
        Bico:string[2];
        Encerrante:string[8];
    end;

type
    visualizacao=record
        stfull:string[250];
    end;

type
    StStatus=record
        value:string[100];
    end;
type
    Retorno=record
        value:string[100];
    end;
Type
    Virgula=record
        ptotal:byte;
        ppu:byte;
        litragem:byte;
    end;
type
    info=record
        titulo:string[20];
        versao:string[5];
        data:string[10];
        autor:string[20];
    end;
    Error       =(ErroString,None,ErroCodBico,ErroCaracterModo,ErroTimeout,ErroResposta);
    StOptions   =(Livre,Pronta,Falha,Concluiu,Abastecendo,Bloqueada,SolicitaLib);
    MultiStatus =record
          Status:array [1..48] of StOptions;
    end;
    Online=record
          Litragem: array [1..48] of real;
          Bico: array [1..48] of string[2];
    end;
    Encerrante=record
          Bico:string[2];
          Valor:real;
    end;
    canal=record
          canal: array [1..48] of byte;
          PuAux: array [1..48] of double;
    end;

    Enc=record
        bico:string[2];
        tipo:string[1];
        valor:string[8];
    end;

implementation

end.
 