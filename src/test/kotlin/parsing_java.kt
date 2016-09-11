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
}