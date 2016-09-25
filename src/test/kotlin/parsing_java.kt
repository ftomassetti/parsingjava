import org.junit.Test
import kotlin.test.assertTrue

class ParsingTest {

    fun check(code: String) {
        val res= JavaParserFacade.parse(code)
        assertTrue(res.isCorrect(), message=res.errors.joinToString(", "))
    }

    @Test
    fun parseSuperSimpleClass() {
        val code = """
        class A {}
        """
        check(code)
    }

    @Test
    fun parseClassWithFields() {
        val code = """
        class A { int i; boolean b; String s;}
        """
        check(code)
    }

    @Test
    fun parseClassWithMethods() {
        val code = """
        class A {
            void foo(){
            }

            int bar(int a) {
                return a;
            }
        }
        """
        check(code)
    }

    @Test
    fun parseSuperSimpleInterface() {
        val code = """
        interface A {}
        """
        check(code)
    }
}