/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Node;

/**
 *
 * @author Daniela
 */
public class Symbol_Table {
    protected String id;
    protected String type;
    
    Symbol_Table(){
        id = "";
        type ="";
    }
    
   Symbol_Table(String id, String type){
       this.id = id;
       this.type = type;
   }
   
   String getId(){
       return id;
   }
   
   String getType(){
       return type;
   }
}
