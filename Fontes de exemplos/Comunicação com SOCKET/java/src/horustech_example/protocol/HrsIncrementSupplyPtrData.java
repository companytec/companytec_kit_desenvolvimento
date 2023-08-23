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
public class HrsIncrementSupplyPtrData extends HrsProtocolData
{
    private int read_ptr;
    private int write_ptr;
    
    public HrsIncrementSupplyPtrData(String data) throws Exception {
        super(data);
        
        if (data.length() == 12)
        {
            this.read_ptr    = Integer.parseInt(data.substring(0,6));
            this.write_ptr    = Integer.parseInt(data.substring(6,12));
        }
        else throw new Exception("Invalid data");
    }

    @Override
    public void Print() {
        System.out.println("read_ptr: " + this.read_ptr);
        System.out.println("read_ptr: " + this.write_ptr);
    }
    
}
