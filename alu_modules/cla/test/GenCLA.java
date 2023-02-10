package alu_modules.cla.test;

public class GenCLA {
    public static void main(String[] args) {
        for (int i = 0; i < 9; i++) {
            System.out.println("wire [" + i + ":0] w" + (i + 1) + ";");
            for (int j = 0; j <= i; j++) {
                String strBuild = "and(w" + (i + 1) + "[" + j + "], ";
                for (int k = 0; k <= j + 1; k++) {
                    if ((i - k) == -1){
                        strBuild = strBuild + "cin);";
                    } else if (k == j + 1) {
                        strBuild = strBuild + "g[" + (i - k) + "]);";
                    } else {
                        strBuild = strBuild + "p[" + (i - k) + "], ";
                    }
                }
                System.out.println(strBuild);
            }
            String orBuild = "or(c[" + (i + 1) + "], g[" + i + "]";
            for (int l = 0; l <= i; l++) {
                orBuild = orBuild + ", w" + (i + 1) + "[" + l + "]";
            }
            System.out.println(orBuild + ");\n");
        }
    }
    
}
