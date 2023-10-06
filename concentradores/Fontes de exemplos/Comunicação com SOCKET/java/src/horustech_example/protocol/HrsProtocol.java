/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package horustech_example.protocol;

/**
 *
 * @author cleberpeter
 */
public class HrsProtocol 
{
    private String GetChecksum(String data, int len)
    {
        byte checksum_acc = 0;
        
        for (int i = 1; i < len; i++) // i = 1 -> jump '>'
        {
            checksum_acc += data.charAt(i);
        }
        
        return String.format("%02X", checksum_acc);
    }
    
    private String GetAskCmdStart()
    {
        return ">?";
    }
    
    private String GetAnswerCmdStart()
    {
        return ">!";
    }
        
    private String FormatLen(String len_str)
    {
        int digits = len_str.length();
        String new_len = len_str;
        
        for (int i = digits; i < 4; i++)
        {
            new_len = "0" + new_len;
        }
        
        return new_len;
    }
    
    private String GetCmdLen(String data)
    {
        int len = data.length();
        
        String hex = Integer.toHexString(len).toUpperCase();
        
        return FormatLen(hex);
    }
    
    public String MountCmd(String cmd_data)
    {
        String cmd_str, cmd_data_str, cmd_len_str;
        
        cmd_data_str = cmd_data;
        cmd_len_str = GetCmdLen(cmd_data_str);
        
        cmd_str = GetAskCmdStart();
        cmd_str += cmd_len_str;
        cmd_str += cmd_data_str;
        cmd_str += GetChecksum(cmd_str, cmd_str.length());
        
        return cmd_str;
    }
    
    public String Parse(String data, String cmd)
    {
        String start_str = data.substring(0, 2);
        
        if (start_str.equals(GetAnswerCmdStart()))
        {
            String len_str = data.substring(2, 6);
            int pckg_len = Integer.parseInt(len_str, 16);
            int len = data.length();
            int data_len = len - 8; // -8 -> - STX - LEN - CHECKSUM
           
            if (data_len == pckg_len) 
            {
                String pckg_checksum = data.substring(len - 2, len);
                String data_checksum = GetChecksum(data, len - 2); // -2 -> -CKECKSUM
                                
                if (pckg_checksum.equals(data_checksum))
                {
                    String cmd_str = data.substring(6, 8);
            
                    if (cmd_str.equals(cmd))
                    {
                        return data.substring(8, len - 2); // return ony data field
                    }
                }
            }
        }
        
        return null;
    }
}
