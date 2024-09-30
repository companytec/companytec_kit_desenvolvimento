/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package horustech_example;

/**
 *
 * @author cleberpeter
 */
public class Helper {
    
    public static int AsciiToInt(char value)
    {
        return value - '0'; // '5' - '0' = 5
    }
    
    public static String PutComma(char comma_pos_str, String str_data)
    {
        int data_len  = str_data.length();
        int comma_pos = AsciiToInt(comma_pos_str);
                
        return str_data.substring(0, data_len - comma_pos) + '.' + str_data.substring(data_len - comma_pos, data_len);
    }
}
