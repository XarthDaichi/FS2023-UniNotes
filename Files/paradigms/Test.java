import java.util.*;

public class Test {

    static void copyA(List<Integer> a, List<Integer> b) {
        for (var e : a)
            b.add(e);
    }

    public static void main(String[] args) {
  	    System.out.println("Hello, World!"); 
        List<Integer> a = new ArrayList<Integer>();
        a.add(1);
        a.add(2);
        a.add(3);
        List<Integer> b = new ArrayList<Integer>();
        copyA(a,b);
    }

    
  
}
