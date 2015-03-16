/**
 * Created by asrg on 2015/3/16.
 */
public class ClientTest {

    public static void main(String[] args) {
        //1.8088888888E10
        String phoneStr = "1.8088888888E10";
        phoneStr = phoneStr.substring(0,phoneStr.length()-3).replace(".","");
        System.out.println(phoneStr);
    }
}
