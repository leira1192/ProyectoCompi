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
public class Type {
    protected String id;
    protected String type;
    
    public Type(String id, String type){
       this.id = id;
       this.type = type;
   }
      public String getId(){
       return id;
   }
   
   public String getType(){
       return type;
   } 
}
