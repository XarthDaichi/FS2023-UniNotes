import java.util.*;

public class Quiz {
    class Food{}
    class Fruit extends Food{}

    static <F extends Fruit> List<? super F> foo(List<? extends F> a) {
        return null;
    }
    public static void main(String[] args) {
        

        List<Fruit> a = new ArrayList<Fruit>();
        a.add(new Fruit());
        List<? super Food> b = foo(a);
        b.add(new Food());
    }
    
}