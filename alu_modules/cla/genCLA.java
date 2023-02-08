package alu_modules.cla;

public class genCLA {
    public static void main(String[] args) {
        for (int i = 0; i < 8; i++) {
            System.out.print("and(g[" + i + "], a[" + i + "], b[" + i + "]);\n");
        }
    }
}
