package lftshft;

import javax.swing.plaf.basic.BasicSliderUI.ScrollListener;

public class shiftGen {
    public static void main(String[] args) {
        sll(32);
    }

    private static void sll(int numMuxes) {
        /*for (int i = 0; i < numMuxes; i++) {
            System.out.println("mux fifth_m" + (i + 16) + "(bus4[" + i + "], bus4[" + (i + 16) + "], select[4], out[" + (i + 16) + "]);");
        }*/
        for (int i = 0; i < 16; i++) {
            System.out.println("mux fifth_m" + i + "(zero, bus4[" + i + "], select[4], out[" + i + "]);");
        }

    }
}
