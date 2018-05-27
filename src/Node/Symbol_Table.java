/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Node;

import java.util.ArrayList;

/**
 *
 * @author Daniela
 */
public class Symbol_Table {
    ArrayList<Type> arr_Symbol_Table;
    
    public Symbol_Table(){
        arr_Symbol_Table = new ArrayList();
    }
   
    public void insertType(String id, String type){
       Type t= new Type(id, type);
       arr_Symbol_Table.add(t);
    }
    
    public boolean existType(String id, String type){
        for (int i = 0; i < arr_Symbol_Table.size() - 1; i++) {
            if(arr_Symbol_Table.get(i).id.equals(id) && arr_Symbol_Table.get(i).type.equals(type))
                return true;
        }       
        return false;
    }
    
    public void deleteType(String id, String type){
        for (int i = 0; i < arr_Symbol_Table.size() - 1; i++) {
            if(arr_Symbol_Table.get(i).id.equals(id) && arr_Symbol_Table.get(i).type.equals(type)){
                arr_Symbol_Table.remove(i);
                return;
            }
        }  
    }
}