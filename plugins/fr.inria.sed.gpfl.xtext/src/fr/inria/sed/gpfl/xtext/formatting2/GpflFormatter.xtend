/*
 * generated by Xtext 2.27.0
 */
package fr.inria.sed.gpfl.xtext.formatting2

import com.google.inject.Inject
import fr.inria.sed.gpfl.Program
import fr.inria.sed.gpfl.xtext.services.GpflGrammarAccess
import org.eclipse.xtext.formatting2.AbstractFormatter2
import org.eclipse.xtext.formatting2.IFormattableDocument

class GpflFormatter extends AbstractFormatter2 {
	
	@Inject extension GpflGrammarAccess

	def dispatch void format(Program program, extension IFormattableDocument document) {
		// TODO: format HiddenRegions around keywords, attributes, cross references, etc. 
		program.prologues.format
		program.statements.format
	}
	
	// TODO: implement for ProloguesElt, InitSeq, AutomataDef, AutomataDefTail, Stmt, Cmd, Or, And, Equality, Comparison, MulOrDiv, Not, Plus, Minus
}
