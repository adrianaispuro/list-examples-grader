import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;

public class TestListExamples {
  @Test(timeout = 100)
  public void testTimeout() {
    while(true) {}
  }
  // Write your grading tests here!
  @Test
  public void testFilter() {
    List<String> input1 = new ArrayList<String>();
    input1.add("Hello");
    input1.add("Test");
    input1.add("yes");

    List<String> input2 = new ArrayList<String>();
    input2.add("Hello");
    input2.add("Test");
    input2.add("yes");
    assertEquals(input2, ListExamples.filter(input1, new StringChecker());
  }
}
