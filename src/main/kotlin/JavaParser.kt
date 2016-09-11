
import me.tomassetti.parsingjava.JavaLexer
import me.tomassetti.parsingjava.JavaParser
import org.antlr.v4.runtime.*
import org.antlr.v4.runtime.atn.ATNConfigSet
import org.antlr.v4.runtime.dfa.DFA
import java.util.*

/**
 * Created by federico on 11/09/16.
 */

data class ParsingError(val message: String)

data class ParsingResult(val errors: List<ParsingError>, val root: JavaParser.JavaFileContext?)

fun ParsingResult.isCorrect() = errors.isEmpty() && root != null

object JavaParserFacade {

    fun parse(code: String) : ParsingResult {
        val errors = LinkedList<ParsingError>()
        val errorListener = object : ANTLRErrorListener{
            override fun reportAmbiguity(p0: Parser?, p1: DFA?, p2: Int, p3: Int, p4: Boolean, p5: BitSet?, p6: ATNConfigSet?) {
                throw UnsupportedOperationException("not implemented") //To change body of created functions use File | Settings | File Templates.
            }

            override fun reportAttemptingFullContext(p0: Parser?, p1: DFA?, p2: Int, p3: Int, p4: BitSet?, p5: ATNConfigSet?) {
                throw UnsupportedOperationException("not implemented") //To change body of created functions use File | Settings | File Templates.
            }

            override fun syntaxError(p0: Recognizer<*, *>?, p1: Any?, p2: Int, p3: Int, message: String, p5: RecognitionException?) {
                errors.add(ParsingError(message))
            }

            override fun reportContextSensitivity(p0: Parser?, p1: DFA?, p2: Int, p3: Int, p4: Int, p5: ATNConfigSet?) {
                throw UnsupportedOperationException("not implemented") //To change body of created functions use File | Settings | File Templates.
            }
        }
        val lexer = JavaLexer(ANTLRInputStream(code))
        lexer.removeErrorListeners()
        lexer.addErrorListener(errorListener)
        val tokens = CommonTokenStream(lexer)
        val parser = JavaParser(tokens)
        parser.removeErrorListeners()
        parser.addErrorListener(errorListener)
        return ParsingResult(errors, parser.javaFile())
    }

}
