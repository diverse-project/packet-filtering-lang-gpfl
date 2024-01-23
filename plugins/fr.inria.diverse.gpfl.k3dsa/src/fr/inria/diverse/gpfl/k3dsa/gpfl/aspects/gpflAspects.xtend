package fr.inria.diverse.gpfl.k3dsa.gpfl.aspects

import fr.inria.diverse.k3.al.annotationprocessor.Aspect
import fr.inria.diverse.gpfl.Program
import fr.inria.diverse.gpfl.Prologue
import fr.inria.diverse.gpfl.InitSeq
import fr.inria.diverse.gpfl.Automata
import fr.inria.diverse.gpfl.Stmt
import fr.inria.diverse.gpfl.Cmd
import fr.inria.diverse.gpfl.NewAutomata
import fr.inria.diverse.gpfl.Alarm
import fr.inria.diverse.gpfl.Send
import fr.inria.diverse.gpfl.SetVariable
import fr.inria.diverse.gpfl.StepAutomata
import fr.inria.diverse.gpfl.Nop
import fr.inria.diverse.gpfl.Accept
import fr.inria.diverse.gpfl.Drop
import fr.inria.diverse.gpfl.Condition
import fr.inria.diverse.gpfl.Iteration
import fr.inria.diverse.gpfl.NewInterruption
import fr.inria.diverse.gpfl.Filter
import fr.inria.diverse.gpfl.State
import fr.inria.diverse.gpfl.Transition
import fr.inria.diverse.gpfl.Block
import fr.inria.diverse.gpfl.Packet
import fr.inria.diverse.gpfl.Expression
import fr.inria.diverse.gpfl.UnaryOp
import fr.inria.diverse.gpfl.BinaryOp
import fr.inria.diverse.gpfl.PortRef
import fr.inria.diverse.gpfl.StringLiteral
import fr.inria.diverse.gpfl.IntLiteral
import fr.inria.diverse.gpfl.BooleanLiteral
import fr.inria.diverse.gpfl.Not
import fr.inria.diverse.gpfl.Or
import fr.inria.diverse.gpfl.And
import fr.inria.diverse.gpfl.Equality
import fr.inria.diverse.gpfl.Inequality
import fr.inria.diverse.gpfl.GreaterOrEqual
import fr.inria.diverse.gpfl.LowerOrEqual
import fr.inria.diverse.gpfl.Greater
import fr.inria.diverse.gpfl.Lower
import fr.inria.diverse.gpfl.Plus
import fr.inria.diverse.gpfl.Minus
import fr.inria.diverse.gpfl.Mult
import fr.inria.diverse.gpfl.Div
import fr.inria.diverse.gpfl.Neg
import fr.inria.diverse.gpfl.VariableDeclaration
import fr.inria.diverse.gpfl.VariableRef
import fr.inria.diverse.gpfl.BooleanDec
import fr.inria.diverse.gpfl.IntegerDec
import fr.inria.diverse.gpfl.StringDec
import fr.inria.diverse.gpfl.Port
import fr.inria.diverse.gpfl.Event
import fr.inria.diverse.gpfl.NewEventOccurence
import fr.inria.diverse.gpfl.Read
import fr.inria.diverse.gpfl.BytesLiteral
import fr.inria.diverse.gpfl.BytesDec

import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.ProgramAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.PrologueAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.InitSeqAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.AutomataAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.StmtAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.CmdAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.ProgramAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.NewAutomataAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.AlarmAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.SendAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.SetVariableAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.StepAutomataAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.NopAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.AcceptAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.DropAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.ConditionAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.IterationAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.NewInterruptionAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.FilterAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.StateAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.TransitionAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.BlockAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.ExpressionAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.UnaryOpAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.BinaryOpAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.PortRefAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.StringLiteralAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.IntLiteralAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.BooleanLiteralAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.NotAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.OrAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.AndAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.EqualityAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.InequalityAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.GreaterOrEqualAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.LowerOrEqualAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.GreaterAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.LowerAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.PlusAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.MinusAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.MultAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.DivAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.NegAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.VariableRefAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.VariableDeclarationAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.StringDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.BooleanDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.IntegerDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.EventAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.NewEventOccurenceAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.ReadAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.BytesDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.BytesLiteralAspect.*

import fr.inria.diverse.k3.al.annotationprocessor.Main
import fr.inria.diverse.k3.al.annotationprocessor.InitializeModel
import org.eclipse.emf.common.util.EList
import fr.inria.diverse.gpfl.GpflFactory
import org.eclipse.core.resources.ResourcesPlugin
import org.eclipse.core.resources.IWorkspace
import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystem
import fr.inria.diverse.k3.al.annotationprocessor.Step
import fr.inria.diverse.gpfl.k3dsa.gpfl.modules.GpflMessagingModule
import fr.inria.diverse.gpfl.k3dsa.gpfl.modules.IOModule
import fr.inria.diverse.gpfl.k3dsa.gpfl.modules.GpflPortsModule
import java.math.BigInteger

@Aspect(className=Program)
class ProgramAspect {
	def MessagingSystem logger() {
		GpflMessagingModule.logger
	}
	
	public static var endOfFilter = false
	
	
	@InitializeModel
	def void initializeModel(EList<String> args) {
		endOfFilter = false
		// ------------ Read input file and create the packets ------------ //
		_self.packets.clear
		_self.currentTime = 0
		val IWorkspace workspace = ResourcesPlugin.getWorkspace()
		try {			
			IOModule.createPacketsFromFile(_self, workspace.root.findMember(args.get(0)).locationURI.path)
		} catch(NullPointerException e) {
			GpflMessagingModule.logger.error("Input file " + args.get(0) + " not found. Go check run configurations", "Gpfl")
			e.printStackTrace
		}
		try {
			IOModule.createOutputFile(workspace.root.findMember(args.get(1)).locationURI.path)
		} catch(NullPointerException e) {
			GpflMessagingModule.logger.error("Output file " + args.get(1) + " not found. Go check run configurations", "Gpfl")
			e.printStackTrace
		}
	}
	
	@Main
	@Step
	def void run() {
 		_self.prologue.run(_self)
 		for (packet : _self.packets) {
			_self.currentPacket = packet			
	 		_self.filter.run(_self)
		}
	}
}


// --------------- AUTOMATA  --------------- //

@Aspect(className=Automata)
class AutomataAspect {

}

@Aspect(className=State)
class StateAspect {

}

@Aspect(className=Transition)
class TransitionAspect {

}

@Aspect(className=Event)
class EventAspect {

}

// --------------- STRUCUTURE  --------------- //

@Aspect(className=Prologue)
class PrologueAspect {
	def void run(Program root) {
		_self.init.run(root)
	}
}

@Aspect(className=InitSeq)
class InitSeqAspect {
	def void run(Program root) {
		_self.block.run(root)
	}
}

@Aspect(className=Filter)
class FilterAspect {
	def void run(Program root) {
		val oldTime = root.currentTime
		root.currentTime = root.currentPacket.time
		// handle interruptions
		for (interrupt : root.interruptions) {
			val nextInterrupt = Math.floor((oldTime+interrupt.time)/interrupt.time)*interrupt.time
			if ((!interrupt.loop && root.currentTime >= interrupt.time && interrupt.time > oldTime)
				|| (interrupt.loop && nextInterrupt > oldTime && nextInterrupt <= root.currentTime)
			) {			
				var i = 0
				do {
					interrupt.block.run(root)
					root.logger.debug("Interruption @ "+(nextInterrupt+(interrupt.time*i)), "Gpfl")
					i++
				}while(nextInterrupt+(interrupt.time*i) <= root.currentTime)
			}
		}
		_self.block.run(root)
		endOfFilter = false
	}
}

@Aspect(className=Block)
class BlockAspect {
	def void run(Program root) {
		_self.currentStmt = _self.firstStmt
		while (_self.currentStmt !== null && !endOfFilter) {
			_self.currentStmt.run(root)
			_self.currentStmt = _self.currentStmt.next
		}
	}
}

// --------------- STATEMENT  --------------- //

@Aspect(className=Stmt)
abstract class StmtAspect {
	def void run(Program root) {
		root.logger.error("Statement: run of " +_self +" should never occur, please tell the developer to write a method run for this class", "Gpfl")
	}
}

@Aspect(className=Condition)
class ConditionAspect extends StmtAspect {
	def void run(Program root) {
		if(_self.getIf.eval(root) as Boolean) {
			_self.then.run(root)
		}
	}
}

@Aspect(className=Iteration)
class IterationAspect extends StmtAspect {
	def void run(Program root) {
		while (_self.getWhile.eval(root) as Boolean) {
			_self.then.run(root)
		}
	}
}

@Aspect(className=NewInterruption)
class NewInterruptionAspect extends StmtAspect {
	def void run(Program root) {
		root.interruptions.add(_self)
	}
}

@Aspect(className=StepAutomata)
class StepAutomataAspect extends StmtAspect {
	def void run(Program root) {
		val activableTrans = _self.idAutomata.value.transitions.findFirst[t | 
			t.from === _self.idAutomata.currentState && t.event === _self.eventOccurence.event
		]
		if (activableTrans === null) {
			_self.block.run(root)
		} else {
			_self.idAutomata.currentState = activableTrans.to
		}
	}
}

// --------------- COMMAND  --------------- //

@Aspect(className=Cmd)
abstract class CmdAspect extends StmtAspect {
	def void run(Program root) {
		root.logger.error("Command: run of " +_self +" should never occur, please tell the developer to write a method run for this class", "Gpfl")
	}
}

@Aspect(className=NewAutomata)
class NewAutomataAspect extends CmdAspect {
	def void run(Program root) {
		_self.currentState = _self.value.initialState
	}
}

@Aspect(className=Alarm)
class AlarmAspect extends CmdAspect {
	def void run(Program root) {
		root.logger.error("ALARM @ "+ root.currentTime+ ": " + _self.message.eval(root) as String, "Gpfl")
	}
}

@Aspect(className=Send)
class SendAspect extends CmdAspect {
	def void run(Program root) {
		var packet = "("+root.currentTime+";"
			+ GpflPortsModule.oppositePort(root.inPorts, _self.packet.inPort).name+";" 
			+ _self.packet.content + ")"
		root.logger.debug("SEND " + packet, "Gpfl")
		
		IOModule.writePacket(root.inPorts, _self.packet)
		endOfFilter = true
	}
}

@Aspect(className=SetVariable)
class SetVariableAspect extends CmdAspect {
	def void run(Program root) {
		val value = _self.value.eval(root)
		if (_self.declaration instanceof VariableDeclaration){	
			var variable = root.variables.findFirst[v | v.name.equals(_self.declaration.name)]
			// If the variable already has been initialized
			// just change the value
			if (variable instanceof IntegerDec) {
				variable.value = value as Integer
			} else if (variable instanceof StringDec) {
				variable.value = value as String
			} else if (variable instanceof BooleanDec) {
				variable.isTrue = value as Boolean
			} else { // if it's the initialization
				// delete the old bad typed version and replace it with a well types and initialized value
				root.variables.removeIf[v | v.name.equals(_self.declaration.name)]
				if (value instanceof Integer) {
					var newVar = GpflFactory.eINSTANCE.createIntegerDec
					newVar.name = _self.declaration.name
					newVar.value = value
					root.variables.add(newVar)
				} else if (value instanceof String) {
					if(_self.value instanceof BytesLiteral) {
						var newVar = GpflFactory.eINSTANCE.createBytesDec
						newVar.name = _self.declaration.name
						newVar.value = value
						root.variables.add(newVar)
					} else {
						var newVar = GpflFactory.eINSTANCE.createStringDec
						newVar.name = _self.declaration.name
						newVar.value = value
						root.variables.add(newVar)
					}
				} else if (value instanceof Boolean) {
					var newVar = GpflFactory.eINSTANCE.createBooleanDec
					newVar.name = _self.declaration.name
					newVar.isTrue = value
					root.variables.add(newVar)
				}
			}
		}
	}
}

@Aspect(className=Nop)
class NopAspect extends CmdAspect {
	def void run(Program root) { }
}

@Aspect(className=Accept)
class AcceptAspect extends CmdAspect {
	def void run(Program root) {
		var packet = "("+root.currentTime+";"
			+ GpflPortsModule.oppositePort(root.inPorts, root.currentPacket.inPort).name+";" 
			+ root.currentPacket.content + ")"
		root.logger.debug("ACCEPT " + packet, "Gpfl")
		
		IOModule.writePacket(root.inPorts, root.currentPacket)
		endOfFilter = true
	}
}

@Aspect(className=Drop)
class DropAspect extends CmdAspect {
	def void run(Program root) {
		var packet = "("+root.currentTime+";"
			+ root.currentPacket.inPort.name
			+";"+root.currentPacket.content+")"
		root.logger.debug("DROP " + packet, "Gpfl")
		endOfFilter = true
	}
}

@Aspect(className=NewEventOccurence)
class NewEventOccurenceAspect extends CmdAspect {
	def void run(Program root) {
		var eventOcc = GpflFactory.eINSTANCE.createEventOccurence
		eventOcc.name = _self.occurence.name
		eventOcc.event = _self.value
		root.prologue.eventPool.add(eventOcc)
	}
}

// --------------- EXPRESSION  --------------- //

@Aspect(className=Expression)
abstract class ExpressionAspect {
	def Object eval(Program root) {
		root.logger.error("Expression: eval of " + _self + " should never occur, please tell the developer to write a method run for this class", "Gpfl")
		return null;
	}
}


@Aspect(className=VariableRef)
class VariableRefAspect extends ExpressionAspect {
	def Object eval(Program root) {
		return root.variables.findFirst[v | v.name.equals(_self.variable.name)].eval(root)
	}
}

@Aspect(className=PortRef)
class PortRefAspect extends ExpressionAspect {
	// a port ref can be called only to check if it's the current port, so it's a boolean
	def Object eval(Program root) {
		return root.currentPacket.inPort.equals(_self.port)
	}
}

@Aspect(className=StringLiteral)
class StringLiteralAspect extends ExpressionAspect {
	def Object eval(Program root) {
		return _self.value
	}
}

@Aspect(className=IntLiteral)
class IntLiteralAspect extends ExpressionAspect {
	def Object eval(Program root) {
		return _self.value
	}
}

@Aspect(className=BooleanLiteral)
class BooleanLiteralAspect extends ExpressionAspect {
	def Object eval(Program root) {
		return _self.isIsTrue
	}
}

@Aspect(className=BytesLiteral)
class BytesLiteralAspect extends ExpressionAspect {
	def Object eval(Program root) {
		// if it's an hex convert to bin string
		return _self.value.startsWith("0x") ?
			new BigInteger(_self.value.substring(2), 16).toString(2) 
			: _self.value.substring(2)
	}
}

@Aspect(className=Read)
class ReadAspect extends ExpressionAspect {
	def Object eval(Program root) {
		return root.currentPacket.content.toString.substring(_self.offset, _self.offset+_self.length)
	}
}

@Aspect(className=UnaryOp)
abstract class UnaryOpAspect extends ExpressionAspect {
	def Object eval(Program root) {
		root.logger.error("Unary op: eval of " + _self + " should never occur, please tell the developer to write a method run for this class", "Gpfl")
		return null
	}
}

@Aspect(className=Not)
class NotAspect extends UnaryOpAspect {
	def Object eval(Program root) {
		val expr = _self.expression.eval(root)
		try {
			return !(expr as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot invert " + expr + " because it's not a boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Neg)
class NegAspect extends UnaryOpAspect {
	def Object eval(Program root) {
		val expr = _self.expression.eval(root)
		try {
			return -(expr as Integer)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot neg " + expr + " because it's not an integer", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=BinaryOp)
abstract class BinaryOpAspect extends ExpressionAspect {
	def Object eval(Program root) {
		root.logger.error("Binary op: eval of " + _self + " should never occur, please tell the developer to write a method run for this class", "Gpfl")
		return null
	}
}

@Aspect(className=Or)
class OrAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		try {
			return (left as Boolean) || (right as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare (|) " + left + (left===null?"":"(" + left.class + ")")
				+ " and " + right + (right===null?"":"(" + right.class + ")"), "Gpfl"
			)
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=And)
class AndAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		try {
			return (left as Boolean) && (right as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare (&) " + left + (left===null?"":"(" + left.class + ")")
				+ " and " + right + (right===null?"":"(" + right.class + ")"), "Gpfl"
			)
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Equality)
class EqualityAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		try {
			return left.equals(right)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare (==) " + left + (left===null?"":"(" + left.class + ")")
				+ " and " + right + (right===null?"":"(" + right.class + ")"), "Gpfl"
			)
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Inequality)
class InequalityAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		try {
			return !left.equals(right)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare (!=) " + left + (left===null?"":"(" + left.class + ")")
				+ " and " + right + (right===null?"":"(" + right.class + ")"), "Gpfl"
			)
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=GreaterOrEqual)
class GreaterOrEqualAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof String && right instanceof String) {
			return (left as String).compareTo(right as String) >= 0 ? true : false
		} else if (left instanceof Integer && right instanceof Integer) {
			return (left as Integer) >= (right as Integer)
		} else {
			root.logger.error("Type mismatch: Cannot compare (>=) " + left + (left===null?"":"(" + left.class + ")")
				+ " and " + right + (right===null?"":"(" + right.class + ")"), "Gpfl"
			)
			return null
		}
	}
}

@Aspect(className=LowerOrEqual)
class LowerOrEqualAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof String && right instanceof String) {
			return (left as String).compareTo(right as String) <= 0 ? true : false
		} else if (left instanceof Integer && right instanceof Integer) {
			return (left as Integer) <= (right as Integer)
		} else {
			root.logger.error("Type mismatch: Cannot compare (<=) " + left + (left===null?"":"(" + left.class + ")")
				+ " and " + right + (right===null?"":"(" + right.class + ")"), "Gpfl"
			)
			return null
		}
	}
}

@Aspect(className=Greater)
class GreaterAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof String && right instanceof String) {
			return (left as String).compareTo(right as String) > 0 ? true : false
		} else if (left instanceof Integer && right instanceof Integer) {
			return (left as Integer) > (right as Integer)
		} else {
			root.logger.error("Type mismatch: Cannot compare (>) " + left + (left===null?"":"(" + left.class + ")")
				+ " and " + right + (right===null?"":"(" + right.class + ")"), "Gpfl"
			)
			return null
		}
	}
}

@Aspect(className=Lower)
class LowerAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof String && right instanceof String) {
			return (left as String).compareTo(right as String) < 0 ? true : false
		} else if (left instanceof Integer && right instanceof Integer) {
			return (left as Integer) < (right as Integer)
		} else {
			root.logger.error("Type mismatch: Cannot compare (<) " + left + (left===null?"":"(" + left.class + ")")
				+ " and " + right + (right===null?"":"(" + right.class + ")"), "Gpfl"
			)
			return null
		}
	}
}

@Aspect(className=Plus)
class PlusAspect extends BinaryOpAspect {
	// we can add two numbers and concatenate two strings
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if ((left instanceof Integer && right instanceof Integer)
			|| (left instanceof String && right instanceof String)
		) {
			return (left as Integer) + (right as Integer)
		} else if (left instanceof String) {
			return (left as String) + right
		} else if (right instanceof String) {
			return left + (right as String)
		}
		root.logger.error("Type mismatch: Cannot add " + left + " and " + right, "Gpfl")
		return null
	}
}

@Aspect(className=Minus)
class MinusAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof Integer && right instanceof Integer) {
			return (left as Integer) - (right as Integer)
		}
		root.logger.error("Type mismatch: Cannot minus " + left + " by " + right, "Gpfl")
		return null
	}
}

@Aspect(className=Mult)
class MultAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof Integer && right instanceof Integer) {
			return (left as Integer) * (right as Integer)
		}
		root.logger.error("Type mismatch: Cannot multiply " + left + " by " + right, "Gpfl")
		return null
	}
}

@Aspect(className=Div)
class DivAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof Integer && right instanceof Integer) {
			if (right == 0) {
				root.logger.error("You cannot divide by 0", "Gpfl")
				return null
			}
			return (left as Integer) - (right as Integer)
		}
		root.logger.error("Type mismatch: Cannot divide " + left + " by " + right, "Gpfl")
		return null
	}
}

@Aspect(className=VariableDeclaration)
class VariableDeclarationAspect {
	def Object eval(Program root) {
		var variable = root.variables.findFirst[v | v.name.equals(_self.name)]
		if (variable instanceof IntegerDec) {
			return variable.value
		} else if (variable instanceof StringDec) {
			return variable.value
		} else if (variable instanceof BooleanDec) {
			return variable.isTrue
		} else {
			return null
		}
	}
}

@Aspect(className=StringDec)
class StringDecAspect extends VariableDeclarationAspect {
	def Object eval(Program root) {
		return _self.value
	}
}

@Aspect(className=BooleanDec)
class BooleanDecAspect extends VariableDeclarationAspect {
	def Object eval(Program root) {
		return _self.isTrue
	}
}

@Aspect(className=IntegerDec)
class IntegerDecAspect extends VariableDeclarationAspect {
	def Object eval(Program root) {
		return _self.value
	}
}

@Aspect(className=BytesDec)
class BytesDecAspect extends VariableDeclarationAspect {
	def Object eval(Program root) {
		return _self.value
	}
}

@Aspect(className=Port)
class PortAspect {

}

@Aspect(className=Packet)
class PacketAspect {

}
