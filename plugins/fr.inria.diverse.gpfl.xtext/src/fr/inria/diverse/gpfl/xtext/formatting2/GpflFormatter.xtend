/*
 * generated by Xtext 2.27.0
 */
package fr.inria.diverse.gpfl.xtext.formatting2

import com.google.inject.Inject
import fr.inria.diverse.gpfl.model.Gpfl.Policy
import fr.inria.diverse.gpfl.model.Gpfl.Prologue
import fr.inria.diverse.gpfl.xtext.services.GpflGrammarAccess
import org.eclipse.xtext.formatting2.AbstractFormatter2
import org.eclipse.xtext.formatting2.IFormattableDocument

class GpflFormatter extends AbstractFormatter2 {
	
	@Inject extension GpflGrammarAccess

	def dispatch void format(Policy Policy, extension IFormattableDocument document) {
		// TODO: format HiddenRegions around keywords, attributes, cross references, etc. 
		Policy.prologue.format
		Policy.filter.format
	}

	def dispatch void format(Prologue prologue, extension IFormattableDocument document) {
		// TODO: format HiddenRegions around keywords, attributes, cross references, etc. 
		for (automata : prologue.automataDefinition) {
			automata.format
		}
		prologue.init.format
	}
	
	// TODO: implement for InitSeq, Filter, Automata, Block, Condition, Iteration, NewInterruption, StepAutomata, Send, Alarm, SetVariable, Packet, Or, And, BinaryOp, Not, Equality, Inequality, GreaterOrEqual, LowerOrEqual, Greater, Lower, Plus, Minus, Mult, Div
}
