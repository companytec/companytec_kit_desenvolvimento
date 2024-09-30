/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package horustech_example.protocol;

import horustech_example.Helper;
import static horustech_example.Helper.PutComma;

/**
 *
 * @author cleberpeter
 */
public class HrsSupplyData extends HrsProtocolData
{
    private int     register;
    private int     nozzle;
    private int     fuel_code;
    private int     tank;
    private float   total;
    private float   volume;
    private float   price;
    private int     fueling_time;
    private String  date;
    private String  hour;
    private float   init_total;
    private float   end_total;
    private String  attendant_tag;
    private String  client_tag;
    private int     tank_volume;
    
    public HrsSupplyData(String data) throws Exception 
    {
        super(data);
        
        if (data.length() == 105)
        {
            this.register    = Integer.parseInt(data.substring(0,6));
            this.nozzle      = Integer.parseInt(data.substring(6,8));
            this.fuel_code   = Integer.parseInt(data.substring(8,10));
            this.tank        = Integer.parseInt(data.substring(10,12));
            
            String total_str  = data.substring(12,18);
            String volume_str = data.substring(18,24);
            String price_str  = data.substring(24,28);
                        
            this.total  = Float.parseFloat(Helper.PutComma(data.charAt(28), total_str));
            this.volume = Float.parseFloat(Helper.PutComma(data.charAt(29), volume_str));
            this.price  = Float.parseFloat(Helper.PutComma(data.charAt(30), price_str));
            
            this.fueling_time = Integer.parseInt(data.substring(31,35));
            
            this.date = data.substring(35,37) + '/' + data.substring(37,39) + '/' + data.substring(39,41);
            this.hour = data.substring(41,43) + ':' + data.substring(43,45);
            
            this.init_total = Float.parseFloat(Helper.PutComma('2', data.substring(45,55)));
            this.end_total  = Float.parseFloat(Helper.PutComma('2', data.substring(55,65)));
            
            this.attendant_tag = data.substring(65,81);
            this.client_tag = data.substring(81,97);
            this.tank_volume = Integer.parseInt(data.substring(97,105));
        }
        else throw new Exception("Invalid data");
    }
    
    public void Print()
    {
        System.out.println("register: "  + this.register);
        System.out.println("nozzle: "    + this.nozzle);
        System.out.println("fuel_code: " + this.fuel_code);
        System.out.println("tank: "      + this.tank);
        System.out.println("total: "     + this.total);
        System.out.println("volume: "    + this.volume);
        System.out.println("price: "     + this.price);
        System.out.println("fueling_time: "     + this.fueling_time);
        System.out.println("date: "             + this.date);
        System.out.println("hour: "             + this.hour);
        System.out.println("init_total: "       + this.init_total);
        System.out.println("end_total: "        + this.end_total);
        System.out.println("attendant_tag: "    + this.attendant_tag);
        System.out.println("client_tag: "       + this.client_tag);
        System.out.println("tank_volume: "       + this.tank_volume);
        System.out.println("########################################");
    }
}
