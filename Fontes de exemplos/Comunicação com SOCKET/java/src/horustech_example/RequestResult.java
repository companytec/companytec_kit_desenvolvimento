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

public class RequestResult
{    
    public boolean success;
    public String message;
    
    public RequestResult(boolean success, String message)
    {
        this.success = success;
        this.message = message;
    }
    
    public void Print()
    {
        System.out.println("status: " + this.success);
        System.out.println("message: " + this.message);
    }
}
