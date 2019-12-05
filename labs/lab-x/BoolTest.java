public class BoolTest {
    public static void main(String[] args) {
        Bool trueVal = Bool.valueOf(true);
        Bool falseVal = Bool.valueOf(false);
        //assert trueVal.equals(Bool.TRUE);
        assert trueVal.boolValue();
        //assert !trueVal.equals(Bool.FALSE);
        //assert !trueVal.equals(null);
        //assert falseVal.equals(Bool.FALSE);
        assert !falseVal.boolValue();
        //assert !falseVal.equals(Bool.TRUE);
        //assert !falseVal.equals(null);
    }
}
