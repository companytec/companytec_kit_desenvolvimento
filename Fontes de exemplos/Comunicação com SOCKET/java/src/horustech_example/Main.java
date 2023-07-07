/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package horustech_example;

import horustech_example.protocol.HrsIncrementSupplyPtrCmd;
import horustech_example.protocol.HrsIncrementSupplyPtrData;
import horustech_example.protocol.HrsProtocol;
import horustech_example.protocol.HrsProtocolCmd;
import horustech_example.protocol.HrsReadStatusCmd;
import horustech_example.protocol.HrsReadSupplyCmd;
import horustech_example.protocol.HrsStatusData;
import horustech_example.protocol.HrsSupplyData;

/**
 *
 * @author Cleber Peter
 */
public class Main {
    
    private static TcpClient tcp_client;
    private static HrsProtocol hrs_protocol;
    
    private static enum STATE { CONNECT, READ_STATUS, READ_SUPPLY, INCREMENT_SUPPLY_PTR; }
    
    static STATE sm = STATE.CONNECT;
    
    public static String SendReceive(HrsProtocolCmd cmd)
    {
        String cmd_str = hrs_protocol.MountCmd(cmd.GetData());
        RequestResult request_result = tcp_client.SendReceive(cmd_str, 1000);
        if (request_result.success)
        {
            return hrs_protocol.Parse(request_result.message, cmd.GetIdx());
        }
        else 
        {
            request_result.Print();
            if (!tcp_client.Is_Connected()) sm = STATE.CONNECT; // reconnect
        }
        
        return null;
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws InterruptedException 
    {
        // TODO code application logic here
        String ip_console = "192.168.0.192";
        int port_console = 2001;
        
        tcp_client = new TcpClient(true);
        hrs_protocol = new HrsProtocol();
        
                
        while (true)
        {
            switch(sm)
            {
                case CONNECT:
                {
                    RequestResult connect_result = tcp_client.Connect(ip_console, port_console, 1000);
                    if (connect_result.success)
                    {
                        sm = STATE.READ_STATUS;
                    }
                    else connect_result.Print();
                }
                break;
                case READ_STATUS:
                {
                    HrsReadStatusCmd cmd = new HrsReadStatusCmd();
                    String data = SendReceive(cmd);
                    if (data != null)
                    {
                        try 
                        {
                            HrsStatusData hrs_status_data = new HrsStatusData(data);
                            hrs_status_data.Print();
                            
                            sm = STATE.READ_SUPPLY;
                        } 
                        catch (Exception ex) 
                        {
                            System.out.println("READ_STATUS: " + ex.toString());
                        }
                    }
                }
                break;
                case READ_SUPPLY:
                {
                    HrsReadSupplyCmd cmd = new HrsReadSupplyCmd();
                    String data = SendReceive(cmd);

                    if (data != null && data.length() > 0) // has supplies to read ?
                    {
                       try 
                       {
                           HrsSupplyData hrs_supply_data = new HrsSupplyData(data);
                           hrs_supply_data.Print();
                           
                           /*BEFORE INCREMENT PTR, SAVE SUPPLY ON DATABASE*/
                           sm = STATE.INCREMENT_SUPPLY_PTR;
                       } 
                       catch (Exception ex) 
                       {
                           System.out.println("READ_SUPPLY: " + ex.toString());
                       }
                    }
                    else sm = STATE.READ_STATUS;
                }
                break;
                case INCREMENT_SUPPLY_PTR:
                    HrsIncrementSupplyPtrCmd cmd = new HrsIncrementSupplyPtrCmd();
                    String data = SendReceive(cmd);
                    if (data != null)
                    {
                        try 
                        {
                            HrsIncrementSupplyPtrData hrs_increment_ptr_supply_data = new HrsIncrementSupplyPtrData(data);
                            hrs_increment_ptr_supply_data.Print();
                            
                            sm = STATE.READ_SUPPLY;
                        } 
                        catch (Exception ex) 
                        {
                            System.out.println("INCREMENT_SUPPLY_PTR: " + ex.toString());
                        }
                    }
                break;
            }
            
            Thread.sleep(1000);
        }
    }
    
}
