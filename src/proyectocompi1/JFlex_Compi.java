/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompi1;

import java.io.File;

/**
 *
 * @author leirA
 */
public class JFlex_Compi {
        public static void main(String[] args){
            File f = new File("src\\proyectocompi1\\lexer.flex");
            jflex.Main.generate(f);
        }
}
