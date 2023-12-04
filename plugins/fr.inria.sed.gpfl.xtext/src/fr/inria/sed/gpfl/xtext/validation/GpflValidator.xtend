/*
 * generated by Xtext 2.27.0
 */
package fr.inria.sed.gpfl.xtext.validation

import fr.inria.sed.gpfl.GpflPackage
import fr.inria.sed.gpfl.NewInterruption
import fr.inria.sed.gpfl.Nop
import fr.inria.sed.gpfl.BinaryOp
import fr.inria.sed.gpfl.Inequality
import fr.inria.sed.gpfl.GreaterOrEqual
import fr.inria.sed.gpfl.Lower
import fr.inria.sed.gpfl.LowerOrEqual
import fr.inria.sed.gpfl.Greater
import fr.inria.sed.gpfl.Equality
import fr.inria.sed.gpfl.BooleanLiteral
import fr.inria.sed.gpfl.IntLiteral
import fr.inria.sed.gpfl.StringLiteral
import fr.inria.sed.gpfl.Plus
import fr.inria.sed.gpfl.Minus
import fr.inria.sed.gpfl.Mult
import fr.inria.sed.gpfl.Div
import fr.inria.sed.gpfl.Filter
import fr.inria.sed.gpfl.Drop
import fr.inria.sed.gpfl.Accept
import fr.inria.sed.gpfl.InitSeq
import fr.inria.sed.gpfl.Program
import org.eclipse.xtext.validation.Check
import org.eclipse.xtext.EcoreUtil2

/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class GpflValidator extends AbstractGpflValidator {

	public static val NEG_TIME_INTERRUPT = "negtimeinterrupt"
	
	@Check
	def checkTimeInterrupt(NewInterruption interupt) {
		if (interupt.time <= 0) {
			error('An interruption must have a time superior to 0',
				GpflPackage.Literals.NEW_INTERRUPTION__TIME,
				NEG_TIME_INTERRUPT
			)
		}
	}
	
	public static val EMPTY_INTERRUPT = "emptyinterrupt"
	
	@Check
	def checkBlockInterrupt(NewInterruption interupt) {
		if (interupt.block.firstStmt instanceof Nop && interupt.block.firstStmt.next === null) {
			warning('This interupt will not execute anything',
				GpflPackage.Literals.NEW_INTERRUPTION__BLOCK,
				EMPTY_INTERRUPT
			)
		}
	}
	
	public static val CONSTANT_COMPARISON = "constantcomparison"
	
	@Check
	def checkConstantComparison(BinaryOp exp) {
		if ((exp instanceof Inequality || exp instanceof Equality
			|| exp instanceof LowerOrEqual || exp instanceof Lower
			|| exp instanceof GreaterOrEqual || exp instanceof Greater)
			&& ((exp.left instanceof BooleanLiteral || exp.left instanceof IntLiteral || exp.left instanceof StringLiteral)
				&& (exp.right instanceof BooleanLiteral || exp.right instanceof IntLiteral || exp.right instanceof StringLiteral)
			)
		) {
			warning( 'constant condition is always false',
				GpflPackage.Literals.BINARY_OP__RIGHT,
				CONSTANT_COMPARISON
			)
		}
	}
	
	public static val WRONG_TYPE_ADDITION = "wrongtypeaddition"
	
	@Check
	def checkTypeAddition(BinaryOp exp) {
		if((exp instanceof Plus || exp instanceof Minus || exp instanceof Mult || exp instanceof Div)
			&& (exp.left instanceof BooleanLiteral || exp.right instanceof BooleanLiteral)
		) {
			error('booleans cannot be used in a calculus',
				GpflPackage.Literals.BINARY_OP__RIGHT,
				WRONG_TYPE_ADDITION
			)
		}
	}
	
//	public static val FILTER_STRATS_WITH_DROP_OR_ACCEPT = "filterstartswithdroporaccept"
//	
//	@Check
//	def checkStartsOfFilter(Filter filter) {
//		if(filter.block.firstStmt instanceof Drop || filter.block.firstStmt instanceof Accept) {
//			warning('this instruction will stop the filter, so the rest of the filter will never be executed',
//				filter.block.firstStmt.eContainingFeature,
//				FILTER_STRATS_WITH_DROP_OR_ACCEPT
//			)
//		}
//	}
//	
//	public static val USELESS_CMD_IN_INIT = "uselesscmdininit"
//	
//	@Check
//	def checkCommandInInit(InitSeq init) {
//		var cmd = init.block.firstStmt
//		while(cmd !== null) {
//			if (cmd instanceof Accept || cmd instanceof Drop || cmd instanceof Nop) {				
//				warning('This command is useless in the initaialisation sequence',
//					cmd.eContainingFeature,
//					USELESS_CMD_IN_INIT
//				)
//			}
//			cmd = cmd.next
//		} 
//	}
}
