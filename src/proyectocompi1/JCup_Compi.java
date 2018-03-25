/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectocompi1;

/**
 *
 * @author leirA
 */
public class JCup_Compi {
    public static void main(String[] args) {

        String params[] = {"-destdir","src\\proyectocompi1","-parser","parser","src\\proyectocompi1\\Parser.cup"};
        try {
            java_cup.Main.main(params);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
