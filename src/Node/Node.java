/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Node;

import java.util.ArrayList;

/**
 *
 * @author leirA
 */


public class Node {
    String val;
    int line = 0, column =0;
    ArrayList<Node> hijos;
//   
    public Node(String v){
        val= v;
        hijos = new ArrayList();
    }
    public Node(String v, int line, int column){
        //System.out.println(v+ " : " + line +" : "+ column);
        this.val =v;
        this.line = line;
        this.column = column;  
        hijos = new ArrayList();             
    }
    
    public void addNode(Node n){
        hijos.add(n);
    } 
    public Node(Node n, int line, int column){
        hijos.add(n);
        this.line = line;
        this.column = column;
               
    }
    
    public void insertNode(Node n, int pos){
        hijos.add(pos, n);
    }
    
    public void addListNode(ArrayList<Node> nodos){
        hijos.addAll(nodos);
    }
    
    public void setNodes(ArrayList<Node> nodos){
        hijos = nodos;
    }

    public int getLine() {
        return line;
    }

    public void setLine(int line) {
        this.line = line;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public ArrayList<Node> getHijos() {
        return hijos;
    }

    public void setHijos(ArrayList<Node> hijos) {
        this.hijos = hijos;
    }
    public ArrayList<Node> getChildren(){
        return hijos;
    }
    
    public String getVal(){
        return val;
    }
    
    
    public void print(String prefix, boolean isTail,javax.swing.JTextArea txtArbol) {
        txtArbol.append(prefix + (isTail ? "└── " : "├── ") + val+"\n");
        for (int i = 0; i < hijos.size() - 1; i++) {
            hijos.get(i).print(prefix + (isTail ? "    " : "│   "), false,txtArbol);
                
        }
        if (hijos.size() > 0) {
            hijos.get(hijos.size() - 1).print(prefix + (isTail ?"    " : "│   "), true,txtArbol);
        }       
       
    }
    
    @Override
    public String toString() {
        return "(" + val + "," + hijos + ')';
    }
    
    public void printEntra(){
//        System.out.println("ENTRA " + this.getVal());
    }
    public void printSale(){
//        System.out.println("SALE " + this.getVal());
    }
    
    
}
