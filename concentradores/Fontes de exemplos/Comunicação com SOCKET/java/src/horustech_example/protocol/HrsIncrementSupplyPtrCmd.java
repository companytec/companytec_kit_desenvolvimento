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
public class HrsIncrementSupplyPtrCmd extends HrsProtocolCmd
{

    @Override
    public String GetData() {
        return GetIdx();
    }

    @Override
    public String GetIdx() {
        return "06";
    }
    
}
