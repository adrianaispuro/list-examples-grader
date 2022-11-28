import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;

class StringCheck implements StringChecker{
  public boolean checkString(String s){return s.contains("est");}
}


public class TestListExamples {
  // @Test(timeout = 100)
  // public void testTimeout() {
  //   while(true) {}
  // }
  // Write your grading tests here!

  @Test
  public void testFilter() {
    List<String> input1 = new ArrayList<String>();
    input1.add("Hello");
    input1.add("Test");
    input1.add("yes");
    input1.add("crest");

    List<String> input2 = new ArrayList<String>();
    input2.add("Test"); 
    input2.add("crest");
    assertEquals(input2, ListExamples.filter(input1, new StringCheck()));
  }

  @Test
  public void testMerge(){
    List<String> out1 = new ArrayList<String>();
    out1.add("almond");
    out1.add("goat");

    List<String> out2 = new ArrayList<String>();
    out2.add("goat cheese");
    out2.add("almond milk");

    List<String> exp = new ArrayList<String>();
    exp.add("almond");
    exp.add("goat");
    exp.add("goat cheese");
    exp.add("almond milk");
    
    assertEquals(exp, ListExamples.merge(out1,out2));
  }
 

}
