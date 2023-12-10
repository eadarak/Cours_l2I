package tp_csv;

import java.io.*;
import java.util.Scanner;

public class LectureFichier{
    public static void main(String[] args) {
        String line;
        try{
            File file = new File("/home/eadarak/Bureau/L2I-2021_officiel/TROISIEME ANNEE/FORMAT D'ECHANGE DE DONNEES/files/tp_1.csv");
            Scanner scan = new java.util.Scanner(file);
            int i=1;
            while(scan.hasNextLine()){
                line=scan.nextLine();
                System.out.println("Ligne " +i+ " : "+line);
                i++;
            }
            scan.close();
        } catch( FileNotFoundException ioex){
            System.out.println(" le fichier n'existe pas");
        }
    }
}

