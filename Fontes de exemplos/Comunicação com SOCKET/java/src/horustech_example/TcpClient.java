/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package horustech_example;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetSocketAddress;
import java.net.Socket;

/**
 *
 * @author cleberpeter
 */

public class TcpClient 
{
    private String ip;
    private int port;
    
    private Socket clientSocket;
    
    private boolean debug;
    private boolean is_connected;
    
    public TcpClient(boolean debug)
    {
        this.debug = debug;
        this.clientSocket = null;
        this.is_connected = false;
    }
    
    public boolean Is_Connected()
    {
        return this.is_connected;
    }
    
    public RequestResult Connect(String ip, int port, int timeout)
    {
        this.ip = ip;
        this.port = port;
        
        try 
        {  
            this.clientSocket = new Socket();
            this.clientSocket.connect(new InetSocketAddress(this.ip, this.port), timeout); 

            this.is_connected = true;
            return new RequestResult(true, null);
        } 
        catch (IOException e) 
        {
            this.is_connected = false;
            return new RequestResult(false, "TcpClient::Connect - " + e.toString());
        }
    }
    
    private RequestResult Send(String data)
    {
        try 
        { 
            if (this.debug) System.out.println("TX: " + data);
            
            OutputStreamWriter osw = new OutputStreamWriter(clientSocket.getOutputStream(), "ISO-8859-1");
            osw.write(data, 0, data.length());
            osw.flush();
            
            return new RequestResult(true, null);
        }
        catch (IOException e) 
        {
            return new RequestResult(false, "TcpClient::Send - " + e.toString());
        }
    }
    
    private RequestResult Read(int timeout)
    {
        try
        { 
            clientSocket.setSoTimeout(timeout);
            BufferedReader br = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
            String data = br.readLine();
            
            if (this.debug) System.out.println("RX: " + data);
            
            return new RequestResult(true, data);
        }
        catch(IOException e)
        {
            return new RequestResult(false, "TcpClient::Read - " + e.toString());
        }
    }
    
    public RequestResult SendReceive(String data, int timeout)
    {
        if (this.Is_Connected())
        {
            RequestResult send_result = this.Send(data);

            if (send_result.success)
            {
                RequestResult read_result = this.Read(timeout);
                return read_result;
            }
            else 
            {
                this.is_connected = false;
                return send_result;
            }
        }
        else return new RequestResult(false, "TcpClient::SendReceive - not_connected");
    }
}
