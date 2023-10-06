
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import java.net.*;
import java.io.*;
import java.util.Timer;
import java.util.TimerTask;
import java.lang.reflect.Method;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Cleber Peter
 */


public class Exemplo_TWC_Java extends javax.swing.JFrame {
   
    
    public static enum ETCP { TX, RX; }
    public static enum ETWC { STATUS,LOOP; }
    public static enum ETWCSTATUS { TX,RX; }
    public static enum ETERMINAL { TX,RX; }
    public static enum ETERMINALCMDS { CLEAN, PENDENCY, READVERSION, WRITEVERSION, WRITEMEN0, WRITEMEN1, WRITEMENA, WRITEMENB, WRITETELA, CANCELED, CHECKED, 
    WRITEODO, WRITECPF, WRITECARDF, WRITEOLEO, WRITEBICO, WRITESENHA, WRITETAG, WRITEVALUE, WRITEABAST, WRITEABASTINIT, WRITEBICOBUSY, WRITEBICOOFF; } 
    public static enum ETERMINALMENU { FROTA,CLIENTE; }
    public enum ECONNECTION { CONNECT, DISCONNECT, RECONNECT, WAIT; }
    public static enum PROTHORUS { STX, INIT, GETLEN, GETDATA, GETCHECK; }
    public static enum CODTCP { isTX,isRX,isTOUT,isNda }
    
    public static class VERSION
    {
        public static String Menu = "2.0";
    }
    
    
    
    public static enum TOUT 
    { 
        CONNECT(10), TX(500), RX(100), RXStatusTwc(1000), TXStatusTwc(500), RXPendencyTWC(10); 
        
        public final int val;
        
        TOUT(int value)
        {
            this.val = value;  
        }
    }
    
    public Horus Hrs;

    public class Reminder 
    {   
       Timer timer;
       int time;
       Object clas;
       Method func;
       Object[] arg;
       public Reminder(int miliseconds,Object o, Method m,Object[] args) 
       {
           time = miliseconds;
           clas = o;
           func = m;
           arg = args;
           timer = new Timer();
           timer.schedule(new RemindTask(), miliseconds*1);
       }

       class RemindTask extends TimerTask 
       {
           public void run() 
           {
               try
               {
                   func.invoke(clas, arg);    
               }
               catch(Exception e)
               {
                   int a;
                   a=10;
               }
               timer.cancel();
               new Reminder(time,clas,func,arg); //reinicia timer
           }
       }
    }
    
    public class Tick
    {
        public int Count;
        
        public Tick ()
        {
            Count = 0;
        }
        
        public int GetTick()
        {
            return Count;
        }
        
        public boolean TickCompare(int val)
        {
            if (val - GetTick() <= 0) return true;
            else return false;
        }
    }
    
    public class Tcp
    {
        String Ip;
        int Port;
        ETCP Sm;
        Tick Tout; 
        boolean is_connected,is_busy, PckgRecept;
        //PrintStream ps = null;
        OutputStreamWriter ps = null;
        Socket clientSocket = null;
        int TimetoTx,TimetoRx;
        String BuffTx, BuffRx;
        
        public Tcp(String ip, int Porta)
        {
            Ip = ip;
            Sm = ETCP.TX;
            Port = Porta;
            TimetoTx = 0;
            TimetoRx = 0;
            Tout = new Tick();
            BuffTx = null;
            BuffRx = null;
        }
        
        public CODTCP Task()
        {
            Tout.Count++;
            switch (Sm)
            {
                case TX:
                   if (Tout.TickCompare(TimetoTx))
                   {
                       TimetoTx = Tout.GetTick() + TOUT.TX.val;
                       TimetoRx = Tout.GetTick() + TOUT.RX.val;
                       if (is_connected && BuffTx != null && is_busy)
                       {
                           
                           if (Write(BuffTx))
                           {
                               is_busy = false;
                               Sm = ETCP.RX;
                               return CODTCP.isTX;
                           }
                       }
                   }
                break;
                case RX:
                   if (!Tout.TickCompare(TimetoRx))
                   {
                       BuffRx = Read();
                       if (BuffRx != null)
                       {
                           PckgRecept = true;
                           Sm = ETCP.TX;
                           return CODTCP.isRX;
                       }
                   }
                   else
                   {
                       Sm = ETCP.TX;
                       return CODTCP.isTOUT;
                   }
                break;
            }
        return CODTCP.isNda;
        }
        
        public boolean Connect()
        {
            try 
            {  
                clientSocket = new Socket(Ip, Port);
                //ps = new PrintStream(clientSocket.getOutputStream());  
                
                is_connected = true;
                return true;
            } 
            catch (Exception e) 
            {
                is_connected = false;
                return false;
            }
        }
        
        public boolean Write(String cmd)
        {
            try 
            { 
                //ps.println(cmd);
                ps = new OutputStreamWriter(clientSocket.getOutputStream(),"ISO-8859-1");
                ps.write(cmd,0,cmd.length());
                ps.flush();
                System.out.println(cmd);
                is_connected = true;
                return true;
            }
            catch (Exception e) 
            {
                is_connected = false;
                return false;
            }
        }
        
        public String Read()
        {
            try
            {  
                if (clientSocket != null)
                {
                    BufferedReader entrada = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                    return entrada.readLine();
                }
                else return "Erro";
            }
            catch(Exception e)
            {
                return "Erro";
            }
        }
        
        public boolean Close()
        {
            try 
            { 
                clientSocket.close();
                is_connected = false;
                return true;
            }
            catch (Exception e) 
            {
                return false;
            }
        }
    }
    
    
    public class Grade 
    {
        JTable Tab;
        DefaultTableModel Modelo;
        boolean On;
        public Grade(JTable Tabela, DefaultTableModel model)
        {
            On = true;
            Modelo = model;
            Tab = Tabela;
            Tab.setModel(Modelo);
        }
        
        public void Write (String Idx,String Cmd1,String Cmd2)
        {
            if (On)
            {
                Modelo.addRow(new String[]{Idx, Cmd1, Cmd2}); 
                Tab.setModel(Modelo);
                Tab.clearSelection(); 
                Tab.changeSelection(Tab.getRowCount() - 1, 0, false, false);
            }
        }
    }
    
    public class HrsProt
    {
        boolean PckgOk;
        int RxCount = 0,RxLenCount = 0,RxDataCount = 0,RxCkCount = 0,RxLen;
        byte RxData;
        int RxChecksumAcc;
        String data,RxCheckSum;
        char RxLenAcc[];
        PROTHORUS Sm;
        
        public HrsProt()
        {
            Sm = PROTHORUS.STX;
            RxLen = 0;
            RxLenCount = 0;
        }
        
        public String Parser (String Buff)
        {
            data = "";
            RxCheckSum = "";
            RxCount = 0;
            int len = Buff.length();
            while (RxCount < len)
            {
                RxData = (byte)Buff.charAt(RxCount);
                RxCount++;
                switch (Sm)
                {
                    case STX:
                        if (RxData == '>')
                        {
                            Sm = PROTHORUS.INIT;
                        }
                    break;
                    case INIT:
                        if (RxData == '!')
                        {
                            Sm = PROTHORUS.GETLEN;
                            RxChecksumAcc = RxData;
                            RxLenAcc = new char[4];
                        }
                    break;
                    case GETLEN:
                        RxChecksumAcc += RxData;
                        RxLenAcc[RxLenCount++] = (char)RxData;
                        if (RxLenCount == 4)
                        {
                            String aux = new String(RxLenAcc);
                            RxLen = Integer.parseInt(aux, 16);
                            RxLenCount = 0;
                            if (RxLen != 0) Sm = PROTHORUS.GETDATA;
                            else return "";
                        }
                    break;
                    case GETDATA:
                        data += Character.toString((char)RxData);
                        RxChecksumAcc += RxData;
                        RxDataCount++;
                        if (RxDataCount == RxLen)
                        {
                            Sm = PROTHORUS.GETCHECK;
                            RxDataCount = 0;
                        }
                    break;
                    case GETCHECK:
                        RxCheckSum += Character.toString((char)RxData);
                        RxCkCount++;
                        if (RxCkCount == 2)
                        {
                            String RxChecksumAccStr = Integer.toString(RxChecksumAcc,16);
                            int RxChecksumAccStrLen = RxChecksumAccStr.length();
                            RxChecksumAccStr = RxChecksumAccStr.substring(RxChecksumAccStrLen - 2, RxChecksumAccStrLen);
                            if (RxCheckSum.equals(RxChecksumAccStr.toUpperCase()))
                            {
                                Sm = PROTHORUS.STX;
                                RxCkCount = 0;
                                return data;
                            }
                        }
                    break;
                }
            }
            return "";
        }
    }
    
    public class Terminal
    {
        public ETERMINAL Sm;
        public ETERMINALCMDS SmCmd;
        public ETERMINALCMDS SmBackCmd;
        public ETERMINALMENU Menu;
        public int Erro;
        public TOUT Tout;
        
        public Terminal ()
        {
            Sm = ETERMINAL.TX;
            SmCmd = ETERMINALCMDS.READVERSION;
            SmBackCmd = ETERMINALCMDS.PENDENCY;
        }
        
        public void Task()
        {
            switch(Sm)
            {
                case TX:
                    Sm = ETERMINAL.RX;
                    String Numlogic =  Hrs.Ajuste(Integer.toString(Hrs.NlogicTwc), '0', 'L', 2);
                    switch (SmCmd)
                    {
                        case PENDENCY:
                            Hrs.Put("2C" + Numlogic);
                        break;
                        case READVERSION:
                            Hrs.Put("2B" + Numlogic + "0E80Terminal|ML");
                            SmBackCmd = SmCmd;
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITEVERSION:
                            Hrs.Put("2E" + Numlogic + "0E81|MG" + Hrs.Ajuste(VERSION.Menu, ' ', 'R', 20 - VERSION.Menu.length()));
                            SmCmd = ETERMINALCMDS.WRITEMEN0;
                        break;
                        case WRITEMEN0:
                            Hrs.Put("2E" + Numlogic + "0E20Abastecer Frota|D0030|T1Insira a Placa: |EM08SSSS-NNN");
                            SmCmd = ETERMINALCMDS.WRITEMEN1;
                        break;
                        case WRITEMEN1:
                            Hrs.Put("2E" + Numlogic + "0E21Abastecer Cliente|D1730|T1Aproxime o Cartão|D2450|T1 do cliente.|D2070|C|KN");
                            SmCmd = ETERMINALCMDS.WRITEMENA;
                        break;
                        case WRITEMENA:
                            Hrs.Put("2E" + Numlogic + "0E2AAbastecer Frota|D0030|T1Insira a Placa: |R|R|EM08SSSS-NNN");
                            SmCmd = ETERMINALCMDS.WRITEMENB;
                        break;
                        case WRITEMENB:
                            Hrs.Put("2E" + Numlogic + "0E2BAbastecer Cliente|D1730|T1Aproxime o Cartão|D2450|T1 do cliente.|D2070|C|KN");
                            SmCmd = ETERMINALCMDS.WRITETELA;
                        break;
                        case WRITETELA:
                            Hrs.Put("2B" + Numlogic + "0E2CCompanytec System|D1820|T2Companytec|D2250|T2Soluções");
                            SmCmd = ETERMINALCMDS.READVERSION;
                        break;
                        case CANCELED:
                            Hrs.Put("2E" + Numlogic + "0E90Terminal|D1535|T1Operação Cancelada|KN");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case CHECKED:
                            Hrs.Put("2E" + Numlogic + "0E91Terminal|T1Sucesso!|R|R|T1Terminal Atualizado ...|KN");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITEODO:
                            Hrs.Put("2E" + Numlogic + "0E82Lê Odômetro|D1730|T1Insira o Odômetro|R|R|D2450|T1 do Veículo.|D3570|EN080");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITECPF:
                            Hrs.Put("2E" + Numlogic + "0E83Le CPF|D2530|T1Insira o CPF|D3045|T1do Cliente|D2065|EC");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITECARDF:
                            Hrs.Put("2E" + Numlogic + "0E84Le Cartão|D3030|T1Aproxime o|D3050|T1seu Cartão.|D2070|C|KN");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITEOLEO:
                            Hrs.Put("2E" + Numlogic + "0E85Le Óleo|D2430|T1Troca de óleo?|D2250|T1<1:Sim   2:Não>|D5070|EN010");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITEBICO:
                            Hrs.Put("2E" + Numlogic + "0E86Le Bico|D2530|T1Insira o Bico.|D4550|EN020");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITESENHA:
                            Hrs.Put("2E" + Numlogic + "0E87Le Senha|D2530|T1Insira a Senha|D2850|T1de 5 dígitos.|D4070|EM05NNNKK");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITETAG:
                            Hrs.Put("2E" + Numlogic + "0E88Le Tag|D2530|T1Leia a Tag do|D3550|T1Veiculo.|D2170|C|KC");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITEVALUE:
                            Hrs.Put("2E" + Numlogic + "0E89Le Valor|D1830|T1Insira o Valor ($)|D2150|T1do abastecimento|D3870|EN062");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITEABAST:
                            switch (Menu)
                            {
                                case FROTA:
                                    Hrs.Put("26" + jTextField6.getText() + jTextField5.getText() + "0S00000020V00000");
                                break;
                                case CLIENTE:
                                    Hrs.Put("26" + jTextField12.getText() + jTextField8.getText() + "0S" + jTextField13.getText() + "20$00000");
                                break;
                                    
                            }
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITEABASTINIT:
                            Hrs.Put("2E" + Numlogic + "0E92Terminal|T1Sucesso!|R|R|T1Bico Liberado ...|KN");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITEBICOBUSY:
                            Hrs.Put("2E" + Numlogic + "0E93Terminal|T1Erro!|R|R|T1Bico Ocupado ...|KC");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                        case WRITEBICOOFF:
                            Hrs.Put("2E" + Numlogic + "0E94Terminal|T1Erro|R|R|T1Bico Inexistente ...|KC");
                            SmCmd = ETERMINALCMDS.PENDENCY;
                        break;
                    }
                break;
                case RX:
                    if (Hrs.Prot.PckgOk) // recebeu dados ?
                    {
                        Parser(Hrs.DataRx);
                        Hrs.indexTwc++;
                        Sm = ETERMINAL.TX;
                    }
                break;
            }
        }
        
        public void Parser(String str)
        {
            int len = str.length();
            String cmd = str.substring(0,2);
            String escape = "", index = "", versao = "";
            if (len > 7) 
            {
                escape = str.substring(9, 10);
                index = str.substring(6,8);
            }
            if (cmd.equals("2C"))
            {
                if (Erro < Tout.RXPendencyTWC.val)
                {
                    if (!escape.equals("G"))
                    {
                        if (index.equals("20") || index.equals("2A"))
                        {
                            jTextField2.setText(str.substring(11, len));
                            Menu = ETERMINALMENU.FROTA;
                            SmCmd = ETERMINALCMDS.WRITEODO;
                        }
                        else if (index.equals("21") || index.equals("2B"))
                        {
                            jTextField11.setText(str.substring(14, 30));
                            Menu = ETERMINALMENU.CLIENTE;
                            SmCmd = ETERMINALCMDS.WRITECARDF;
                        }
                        else if (index.equals("80"))
                        {
                            SmBackCmd = SmCmd;
                            versao = str.substring(9,len);
                            if (!versao.equals(Hrs.Ajuste(VERSION.Menu, ' ', 'R', 20 - VERSION.Menu.length())))
                            {
                                SmCmd = ETERMINALCMDS.WRITEVERSION;
                            }
                            else
                            {
                                SmCmd = ETERMINALCMDS.CHECKED;
                            }
                        }
                        else if (index.equals("82"))
                        {
                            jTextField3.setText(str.substring(16, 24));
                            SmCmd = ETERMINALCMDS.WRITECPF;
                        }
                        else if (index.equals("83"))
                        {
                            jTextField4.setText(str.substring(14, 28));
                            SmCmd = ETERMINALCMDS.WRITECARDF;
                        }
                        else if (index.equals("84"))
                        {
                            if (Menu == ETERMINALMENU.FROTA)
                            {
                                jTextField5.setText(str.substring(14, 30));
                                SmCmd = ETERMINALCMDS.WRITEOLEO;
                            }
                            else if (Menu == ETERMINALMENU.CLIENTE)
                            {
                                jTextField8.setText(str.substring(14, 30));
                                SmCmd = ETERMINALCMDS.WRITESENHA;
                            }
                        }
                        else if (index.equals("85"))
                        {
                            char digit = str.charAt(14);
                            SmCmd = ETERMINALCMDS.WRITEBICO;
                            if (digit == '1') jTextField7.setText("Sim");
                            else if (digit == '2') jTextField7.setText("Não");
                            else SmCmd = ETERMINALCMDS.WRITEOLEO;   
                        }
                        else if (index.equals("86"))
                        {
                            String aux = str.substring(12,14);
                            if (Menu == ETERMINALMENU.FROTA) jTextField6.setText(aux);
                            else if (Menu == ETERMINALMENU.CLIENTE) jTextField12.setText(aux);
                            SmCmd = ETERMINALCMDS.WRITEABAST;
                        } 
                        else if (index.equals("87"))
                        {
                            jTextField9.setText(str.substring(14, 19));
                            SmCmd = ETERMINALCMDS.WRITETAG;
                        }
                        else if (index.equals("88"))
                        {
                            jTextField10.setText(str.substring(14, 30));
                            SmCmd = ETERMINALCMDS.WRITEVALUE;
                        }
                        else if (index.equals("89"))
                        {
                            jTextField13.setText(str.substring(14, 20));
                            SmCmd = ETERMINALCMDS.WRITEBICO;
                        }
                        else if (index.equals("93") || index.equals("94"))
                        {
                            SmCmd = ETERMINALCMDS.WRITEBICO;
                        }
                        else Erro++;
                    }
                    else SmCmd = ETERMINALCMDS.CANCELED;
                }
                else
                {
                    Erro = 0;
                    SmCmd = SmBackCmd;
                }
            }
            else if (cmd.equals("26"))
            {
                String valid = str.substring(2,4);
                char erro = valid.charAt(1);
                if (valid.equals("00")) SmCmd = ETERMINALCMDS.WRITEABASTINIT;
                else if (erro == '7') SmCmd = ETERMINALCMDS.WRITEBICOOFF;
                else if (erro == '8') SmCmd = ETERMINALCMDS.WRITEBICOBUSY;
            }
            else if (cmd.equals("2B") || cmd.equals("2E"))
            {
                String indexaux = str.substring(2,4);
                if (indexaux.equals("E1") || indexaux.equals("E5")) SmCmd = ETERMINALCMDS.CLEAN;
                Erro = 0;
            }
            
        }
    }
    
    
    public class Horus
    {
        public Terminal TWC[] = new Terminal[99];
        public Grade Terminal;
        public Tcp Connection;
        public Tick Tout;
        public HrsProt Prot; 
        public ECONNECTION ConnectionSm;
        public ETWC TerminalSm;
        public ETWCSTATUS TerminalStatusSm;
        public JTable Tab;
        int TimetoConnection;
        
        public int TimetoTxStatusTwc, TimetoRxStatusTwc, QtdTwc, indexTwc, NlogicTwc, ListTwc[];
        
        boolean is_Reconnecting;
        byte TxChecksumAcc;
        char TxData[];
        int TxLen;
        String arr, DataRx;
        
        public Horus(JTable tabela)
        {
            String colunas[] = {"Idx","Cmd1","Cmd2"};
            DefaultTableModel modelo = new DefaultTableModel(colunas,0);
            Terminal = new Grade(tabela, modelo);
            
            for (int count = 0; count < 99; count++)
            {
                TWC[count] = new Terminal();
            }
            
            Tout = new Tick();
            ListTwc = new int[99];
            Prot = new HrsProt();
            TimetoConnection = 0;
            is_Reconnecting = false;
            ConnectionSm = ECONNECTION.WAIT;
            TerminalSm = ETWC.STATUS;
            TerminalStatusSm = ETWCSTATUS.TX;
            Method func1;
            
            try
            {
                func1 = Horus.class.getMethod("Task", new Class[]{});
            }
            catch (Exception e)
            {
                func1 = null;
            }
            if (func1!= null)
            {
                new Reminder(TimetoConnection,this,func1,new Object[]{});
            }
        }
        
        public void Task()
        {         
            ConnectionTask();
            CommunicationTask();
            TerminalTask();
            Tout.Count++;
        }      
        
        public void TerminalTask()
        {
            if (Connection.is_connected)
            {
                switch (TerminalSm)
                {
                    case STATUS:
                        QtdTwc = SendStatusTwc();
                        if (QtdTwc != 0)
                        {
                            indexTwc = 0;
                            TerminalSm = ETWC.LOOP;
                        }
                    break;
                    case LOOP:
                        if (indexTwc < QtdTwc)
                        {
                            NlogicTwc = ListTwc[indexTwc];
                            if (NlogicTwc == 0) NlogicTwc = 1;
                            TWC[NlogicTwc].Task();
                        }
                        else TerminalSm = ETWC.STATUS;
                    break;
                }
            }
        }
        
        public void ConnectionTask()
        {
            switch(ConnectionSm)
            {
                case CONNECT:
                    if (Tout.TickCompare(TimetoConnection))
                    {
                        TimetoConnection = TimetoConnection + TOUT.CONNECT.val;
                        Connection = new Tcp(jTextField1.getText(),Integer.parseInt((String)jComboBox3.getSelectedItem()));
                        
                        if (Connection.Connect())
                        {
                            Terminal.Write("Info", "Conectado", jTextField1.getText() + "/" + (String)jComboBox3.getSelectedItem());
                            jButton3.setText("Desconectar");
                            is_Reconnecting = false;
                            ConnectionSm = ECONNECTION.WAIT;
                        }
                        else
                        {
                            Terminal.Write("Info", "Não Conectou", jTextField1.getText() + "/" + (String)jComboBox3.getSelectedItem());
                            jButton3.setText("Parar");
                            if (is_Reconnecting) ConnectionSm = ECONNECTION.DISCONNECT;
                            Inc_Port();
                            Connection.Close();
                        }
                    }
                break;
                case RECONNECT:
                    is_Reconnecting = true;
                    ConnectionSm = ECONNECTION.DISCONNECT;
                break;
                case DISCONNECT:
                    Connection.Close();
                    Terminal.Write("Info", "Desconectado", jTextField1.getText() + "/" + (String)jComboBox3.getSelectedItem());
                    jButton3.setText("Conectar");
                    if (is_Reconnecting)
                    {
                        ConnectionSm = ECONNECTION.CONNECT;
                        TimetoConnection = Tout.GetTick();
                    }
                    else ConnectionSm = ECONNECTION.WAIT;
                break;
                case WAIT:
                
                break;
            }
        }
        
        public void CommunicationTask()
        {
            if (Connection != null)
            {
                if (Connection.is_connected)
                {
                    switch (Connection.Task())
                    {
                        case isTX:
                            Terminal.Write("Tx", Connection.BuffTx.substring(6,8), Connection.BuffTx);
                        break;
                        case isRX:
                            /* .: espera a validação do pacote :. */
                            //Terminal.Write("Rx", Connection.BuffRx.substring(6,8), Connection.BuffRx);
                        break;
                        case isTOUT:
                            Terminal.Write("Info", "Timeout", "Tempo superior a:  " + Integer.toString(TOUT.RX.val));
                        break;
                        case isNda:
                        break;
                    }
                }
                
                if (Connection.PckgRecept) //possui dados a tratar ...
                {
                    Connection.PckgRecept = false;
                    DataRx = Prot.Parser(Connection.BuffRx);
                    if (DataRx != "")
                    {
                        Terminal.Write("Rx", Connection.BuffRx.substring(6,8), Connection.BuffRx);
                        Prot.PckgOk = true;
                    }
                    else Terminal.Write("Info", "Erro na verificação do Pacote", Connection.BuffRx);
                }
            }
        }
        
        public int SendStatusTwc()
        {
            switch (TerminalStatusSm)
            {
                case TX:
                    if (Tout.TickCompare(TimetoTxStatusTwc))
                    {
                        TimetoRxStatusTwc = Tout.GetTick() + TOUT.RXStatusTwc.val;
                        Put("2F");
                        TerminalStatusSm = ETWCSTATUS.RX;
                    }
                    return 0;
                case RX:
                    if (!Tout.TickCompare(TimetoRxStatusTwc)) //tem dados para tratar
                    {
                        if (Prot.PckgOk)
                        {
                            String cmd = DataRx.substring(0,2);
                            if (cmd.equals("2F"))
                            {
                                int len = DataRx.length();
                                if (len > 2)
                                {
                                    QtdTwc = ExtractNumTwc(DataRx,len);
                                    return QtdTwc;
                                }
                                Prot.PckgOk = false; //dados ja coletados
                                TerminalStatusSm = ETWCSTATUS.TX;
                                return 0;
                            }
                            return 0;
                        }
                    }
                    else 
                    {
                        TerminalStatusSm = ETWCSTATUS.TX;
                        TimetoTxStatusTwc = Tout.GetTick() + TOUT.TXStatusTwc.val;
                    }
                    return 0; 
            }
            return 0;
        }
        
        public int ExtractNumTwc(String str, int len)
        {
            int N_term = ((len-2)/2);
            int aux;
            for (int count = 0; count < N_term; count++)
            {
                aux = (count * 2) + 2; 
                String straux = str.substring(aux,aux + 2);
                ListTwc[count] = Integer.parseInt(straux);
            }
            return N_term; 
        }
        
        
        public byte SomaCh(String str)
        {
            byte acc = 0;
            for (int i=0; i < str.length(); i++)
            {
                acc += str.charAt(i);
            }
            return acc;
        }
        
        public String Ajuste(String Txt, char ch, char side, int NewLen) //string indexa do zero
        {
            int count = 0,dif,len = Txt.length();
            char acc[] = new char[NewLen];

            dif = NewLen - len;
            if (dif > 0)
            {
                    for (int count_aux = 0; count < NewLen; count++)
                    {
                            if (side == 'L')
                            {
                                    if (count < dif)
                                    {
                                            acc[count] = ch;
                                    }
                                    else
                                    {
                                            acc[count] = Txt.charAt(count_aux++);
                                    }
                            }
                            else if (side == 'R')
                            {
                                    if (count < len)
                                    {
                                            acc[count] = Txt.charAt(count_aux++);
                                    }
                                    else
                                    {
                                            acc[count] = ch;
                                    }
                            }
                            else break;
                    }
                    //acc[count] = '\0';
                    Txt = new String(acc);
            }
            return Txt;
        }
        
        private void PutBegin()
        {
            TxLen = 0;
            TxChecksumAcc = '?';
            Connection.BuffTx = "";
            Connection.BuffTx += '>';
            Connection.BuffTx += '?';
            TxLen = 2;
        }
        
        private void PutData (String cmd)
        {
            int len = cmd.length();
            char ch;
            TxData = new char[len];
            for (int count = 0; count < len; count++)
            {
                ch = cmd.charAt(count);
                TxData[count] += ch;
                TxChecksumAcc += ch;
            }
            TxLen += len;
        }
        
        private void PutFlush()
        {
          String hex = Integer.toHexString(TxLen-2).toUpperCase();
          String len = Ajuste(hex,'0','L',4); // não conta os marcadores nem o próprio campo.
          TxChecksumAcc += SomaCh(len);
          TxLen += 4;
          Connection.BuffTx += len;
          
          String data = new String(TxData);
          Connection.BuffTx += data;
          
          String ck = String.format("%02X", TxChecksumAcc);
          Connection.BuffTx += ck;
          TxLen += 2;
          Connection.is_busy = true; // terminou de montar o pacote.
        }
        public void Put (String cmd)
        {
            if (Connection.is_connected)
            {
                PutBegin();
                PutData(cmd);
                PutFlush();
                Hrs.Prot.PckgOk = false;
            }
        }
        public void Inc_Port()
        {
           int idx = jComboBox3.getSelectedIndex();
           if (idx < 3) jComboBox3.setSelectedIndex(idx+1);
           else jComboBox3.setSelectedIndex(0);
        }
    }
    
    
    public Exemplo_TWC_Java() {
        initComponents();
              
        Hrs = new Horus(jTable1);
               
        jTable1.getColumnModel().getColumn(0).setPreferredWidth(10);  
        jTable1.getColumnModel().getColumn(1).setPreferredWidth(1);  
        jTable1.getColumnModel().getColumn(2).setPreferredWidth(1);  
        
        jComboBox3.removeAllItems();
        jComboBox3.addItem("2001");
        jComboBox3.addItem("1771");
        jComboBox3.addItem("771");
        jComboBox3.addItem("857");
        
        jTextField1.setText("192.168.0.1");
        jTextField2.setText("");
        jTextField3.setText("");
        jTextField4.setText("");
        jTextField5.setText("");
        jTextField6.setText("");
        jTextField7.setText("");
        jTextField8.setText("");
        jTextField9.setText("");
        jTextField10.setText("");
        jTextField11.setText("");
        jTextField12.setText("");
        jTextField13.setText("");
        jTextField14.setText(VERSION.Menu);
        
        jLabel1.setText("Ip");
        jLabel2.setText("Porta");
        jLabel3.setText("Versão do Menu");
        jLabel4.setText("Placa");
        jLabel5.setText("Odômetro");
        jLabel6.setText("CPF");
        jLabel7.setText("Cartão Frentista");
        jLabel8.setText("Bico");
        jLabel9.setText("Troca de óleo");
        jLabel10.setText("Cartão Frentista");
        jLabel11.setText("Senha");
        jLabel12.setText("Tag do Veículo");
        jLabel13.setText("Cartão Cliente");
        jLabel14.setText("Bico");
        jLabel15.setText("Valor à Abastecer");
        
        
       
        jButton3.setText("Conectar");
        jButton4.setText("Alterar");
        jButton5.setText("Limpar");
        jButton6.setText("Parar");
        
        
        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Conexão"));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder("Abastecimento Frota"));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder("Abastecimento Cliente"));
        
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jButton2 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jComboBox3 = new javax.swing.JComboBox();
        jLabel2 = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();
        jTextField14 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jButton4 = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jTextField2 = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jTextField3 = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        jTextField4 = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jTextField5 = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        jTextField6 = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jTextField7 = new javax.swing.JTextField();
        jPanel3 = new javax.swing.JPanel();
        jTextField8 = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        jTextField9 = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        jTextField10 = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        jTextField11 = new javax.swing.JTextField();
        jLabel13 = new javax.swing.JLabel();
        jTextField12 = new javax.swing.JTextField();
        jLabel14 = new javax.swing.JLabel();
        jLabel15 = new javax.swing.JLabel();
        jTextField13 = new javax.swing.JTextField();
        jButton5 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();

        jButton2.setText("jButton1");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Aplicação Exemplo para TWC in Java © Cleber Peter");
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jTable1.setAutoResizeMode(javax.swing.JTable.AUTO_RESIZE_ALL_COLUMNS);
        jScrollPane1.setViewportView(jTable1);

        getContentPane().add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(285, 11, 771, 550));

        jLabel1.setText("jLabel1");

        jTextField1.setText("jTextField1");
        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });

        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        jComboBox3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox3ActionPerformed(evt);
            }
        });

        jLabel2.setText("jLabel1");

        jButton3.setText("jButton1");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jTextField14.setText("jTextField1");
        jTextField14.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField14ActionPerformed(evt);
            }
        });
        jTextField14.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                jTextField14PropertyChange(evt);
            }
        });

        jLabel3.setText("jLabel1");

        jButton4.setText("jButton1");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, 68, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 90, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField14, javax.swing.GroupLayout.PREFERRED_SIZE, 64, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 66, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(19, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jTextField1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel1))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jComboBox3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 5, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jButton3, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 69, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jTextField14, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton4))
                .addContainerGap(50, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 10, 260, 160));

        jTextField2.setText("jTextField1");
        jTextField2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField2ActionPerformed(evt);
            }
        });

        jLabel4.setText("jLabel1");

        jTextField3.setText("jTextField1");
        jTextField3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField3ActionPerformed(evt);
            }
        });

        jLabel5.setText("jLabel1");

        jTextField4.setText("jTextField1");
        jTextField4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField4ActionPerformed(evt);
            }
        });

        jLabel6.setText("jLabel1");

        jTextField5.setText("jTextField1");
        jTextField5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField5ActionPerformed(evt);
            }
        });

        jLabel7.setText("jLabel1");

        jTextField6.setText("jTextField1");
        jTextField6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField6ActionPerformed(evt);
            }
        });

        jLabel8.setText("jLabel1");

        jLabel9.setText("jLabel1");

        jTextField7.setText("jTextField1");
        jTextField7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField7ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(34, 34, 34)
                        .addComponent(jLabel4))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGap(24, 24, 24)
                                .addComponent(jLabel6))))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jTextField6, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addGap(24, 24, 24)
                                .addComponent(jLabel8)))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 59, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jTextField3, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel7)
                    .addComponent(jTextField5, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9)
                    .addComponent(jTextField7, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(15, 15, 15)
                        .addComponent(jLabel5)))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addComponent(jTextField3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel7)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField5, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel9))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel6)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel8)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jTextField6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 170, 257, -1));

        jTextField8.setText("jTextField1");
        jTextField8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField8ActionPerformed(evt);
            }
        });

        jLabel10.setText("jLabel1");

        jTextField9.setText("jTextField1");
        jTextField9.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField9ActionPerformed(evt);
            }
        });

        jLabel11.setText("jLabel1");

        jTextField10.setText("jTextField1");
        jTextField10.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField10ActionPerformed(evt);
            }
        });

        jLabel12.setText("jLabel1");

        jTextField11.setText("jTextField1");
        jTextField11.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField11ActionPerformed(evt);
            }
        });

        jLabel13.setText("jLabel1");

        jTextField12.setText("jTextField1");
        jTextField12.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField12ActionPerformed(evt);
            }
        });

        jLabel14.setText("jLabel1");

        jLabel15.setText("jLabel1");

        jTextField13.setText("jTextField1");
        jTextField13.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField13ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jTextField8, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jTextField10, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jTextField12, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(24, 24, 24)
                        .addComponent(jLabel14))
                    .addComponent(jLabel12))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 59, Short.MAX_VALUE)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jTextField9, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel13)
                    .addComponent(jTextField11, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel15)
                    .addComponent(jTextField13, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(15, 15, 15)
                        .addComponent(jLabel11)))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addComponent(jTextField9, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel13)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField11, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel15))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel10)
                            .addComponent(jLabel11))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField8, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel12)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jTextField10, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel14)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jTextField12, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jTextField13, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 390, 257, -1));

        jButton5.setText("jButton1");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton5, new org.netbeans.lib.awtextra.AbsoluteConstraints(680, 570, 380, 40));

        jButton6.setText("jButton1");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });
        getContentPane().add(jButton6, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 570, 380, 40));

        getAccessibleContext().setAccessibleName("");
        getAccessibleContext().setAccessibleDescription("");

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jComboBox3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox3ActionPerformed

    private void jTextField2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField2ActionPerformed

    private void jTextField3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField3ActionPerformed

    private void jTextField4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField4ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField4ActionPerformed

    private void jTextField5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField5ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField5ActionPerformed

    private void jTextField6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField6ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField6ActionPerformed

    private void jTextField7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField7ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField7ActionPerformed

    private void jTextField8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField8ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField8ActionPerformed

    private void jTextField9ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField9ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField9ActionPerformed

    private void jTextField10ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField10ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField10ActionPerformed

    private void jTextField11ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField11ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField11ActionPerformed

    private void jTextField12ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField12ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField12ActionPerformed

    private void jTextField13ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField13ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField13ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        if (jButton3.getText() == "Conectar")
        {
            Hrs.ConnectionSm = ECONNECTION.CONNECT;
        }
        else Hrs.ConnectionSm = ECONNECTION.DISCONNECT;
        //System.out.println("Kok");
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jTextField14ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField14ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField14ActionPerformed

    private void jTextField14PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_jTextField14PropertyChange
      
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField14PropertyChange

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        VERSION.Menu = jTextField14.getText();
        for (int count = 0;count < 99; count++)
        {
            Hrs.TWC[count].SmCmd = ETERMINALCMDS.READVERSION;
        }
        
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        String colunas[] = {"Idx","Cmd1","Cmd2"};
        DefaultTableModel modelo = new DefaultTableModel(colunas,0);
        Hrs.Terminal = new Grade(jTable1, modelo);
    // TODO add your handling code here:
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        String str = jButton6.getText();
        if (str.equals("Parar")) 
        {
            jButton6.setText("Continuar");
            Hrs.Terminal.On = false;
        }
        else
        {
            jButton6.setText("Parar");
            Hrs.Terminal.On = true;
        }
    }//GEN-LAST:event_jButton6ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Exemplo_TWC_Java.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Exemplo_TWC_Java.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Exemplo_TWC_Java.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Exemplo_TWC_Java.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Exemplo_TWC_Java().setVisible(true);
            }
        });     
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JComboBox jComboBox3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField10;
    private javax.swing.JTextField jTextField11;
    private javax.swing.JTextField jTextField12;
    private javax.swing.JTextField jTextField13;
    private javax.swing.JTextField jTextField14;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    private javax.swing.JTextField jTextField4;
    private javax.swing.JTextField jTextField5;
    private javax.swing.JTextField jTextField6;
    private javax.swing.JTextField jTextField7;
    private javax.swing.JTextField jTextField8;
    private javax.swing.JTextField jTextField9;
    // End of variables declaration//GEN-END:variables
}


