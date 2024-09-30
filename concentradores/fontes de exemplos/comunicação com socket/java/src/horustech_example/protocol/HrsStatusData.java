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

class NozzlesStatus
{
    private static enum NOZZLE_STATE { BLOCKED, FREE, FUELING, FAIL, NOT_CONFIGURATED, WAIT, READY, BUSY, ERROR; }
    
    private NOZZLE_STATE status;
    private int nozzle;

    public NozzlesStatus(char status, int nozzle)
    {
        this.nozzle = nozzle;
        this.status = GetStatus(status);
    }
    
    public int GetNozzle()
    {
        return nozzle;
    }
    
    public String GetStatusName()
    {
        return GetStatusName(status);
    }

    public static NOZZLE_STATE GetStatus(char status)
    {
        switch(status)
        {
            case 'B': return NOZZLE_STATE.BLOCKED;
            case 'L': return NOZZLE_STATE.FREE;
            case 'A': return NOZZLE_STATE.FUELING;
            case 'F': return NOZZLE_STATE.FAIL;
            case ' ': return NOZZLE_STATE.NOT_CONFIGURATED;
            case 'E': return NOZZLE_STATE.WAIT;
            case 'P': return NOZZLE_STATE.READY;
            case '#': return NOZZLE_STATE.BUSY;
            default : return NOZZLE_STATE.ERROR;
        }
    }
    
    public static String GetStatusName(NOZZLE_STATE status)
    {
        switch(status)
        {
            case BLOCKED:          return "Blocked";
            case FREE:             return "Free";
            case FUELING:          return "Fueling";
            case FAIL:             return "Fail";
            case NOT_CONFIGURATED: return "Not Configurated";
            case WAIT:             return "Wait";
            case READY:            return "Ready";
            case BUSY:             return "Busy";
            default:               return "Error";
        }
    }
}

public class HrsStatusData extends HrsProtocolData 
{
    public static final int NOZZLES = 99;
    
    private NozzlesStatus[] nozzle_status = new NozzlesStatus[99];
    
    public HrsStatusData(String data) throws Exception {
        super(data);
        
        for (int i = 0; i < data.length(); i++)
        {
            nozzle_status[i] = new NozzlesStatus(data.charAt(i), i+1);
        }
    }

    @Override
    public void Print() {
        for (int i = 0; i < NOZZLES; i++)
        {
            if (nozzle_status[i] != null)
            {
                System.out.println("nozzle: " + nozzle_status[i].GetNozzle() + ", status: " + nozzle_status[i].GetStatusName());
            }
            
        }
    }
    
}
