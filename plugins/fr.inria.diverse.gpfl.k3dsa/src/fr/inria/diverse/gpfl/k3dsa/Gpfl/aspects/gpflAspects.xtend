package fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects

import fr.inria.diverse.gpfl.k3dsa.Gpfl.modules.IOModule
import fr.inria.diverse.gpfl.model.gpfl.Accept
import fr.inria.diverse.gpfl.model.gpfl.Alarm
import fr.inria.diverse.gpfl.model.gpfl.And
import fr.inria.diverse.gpfl.model.gpfl.Automata
import fr.inria.diverse.gpfl.model.gpfl.BinaryOp
import fr.inria.diverse.gpfl.model.gpfl.Block
import fr.inria.diverse.gpfl.model.gpfl.BooleanDec
import fr.inria.diverse.gpfl.model.gpfl.BooleanLiteral
import fr.inria.diverse.gpfl.model.gpfl.BytesDec
import fr.inria.diverse.gpfl.model.gpfl.BytesLiteral
import fr.inria.diverse.gpfl.model.gpfl.Cmd
import fr.inria.diverse.gpfl.model.gpfl.Condition
import fr.inria.diverse.gpfl.model.gpfl.Div
import fr.inria.diverse.gpfl.model.gpfl.Drop
import fr.inria.diverse.gpfl.model.gpfl.Equality
import fr.inria.diverse.gpfl.model.gpfl.Event
import fr.inria.diverse.gpfl.model.gpfl.Expression
import fr.inria.diverse.gpfl.model.gpfl.Filter
import fr.inria.diverse.gpfl.model.gpfl.GpflFactory
import fr.inria.diverse.gpfl.model.gpfl.Greater
import fr.inria.diverse.gpfl.model.gpfl.GreaterOrEqual
import fr.inria.diverse.gpfl.model.gpfl.Inequality
import fr.inria.diverse.gpfl.model.gpfl.InitSeq
import fr.inria.diverse.gpfl.model.gpfl.IntLiteral
import fr.inria.diverse.gpfl.model.gpfl.IntegerDec
import fr.inria.diverse.gpfl.model.gpfl.Iteration
import fr.inria.diverse.gpfl.model.gpfl.Lower
import fr.inria.diverse.gpfl.model.gpfl.LowerOrEqual
import fr.inria.diverse.gpfl.model.gpfl.Minus
import fr.inria.diverse.gpfl.model.gpfl.Mult
import fr.inria.diverse.gpfl.model.gpfl.Neg
import fr.inria.diverse.gpfl.model.gpfl.NewAutomata
import fr.inria.diverse.gpfl.model.gpfl.NewEventOccurence
import fr.inria.diverse.gpfl.model.gpfl.NewInterruption
import fr.inria.diverse.gpfl.model.gpfl.Nop
import fr.inria.diverse.gpfl.model.gpfl.Not
import fr.inria.diverse.gpfl.model.gpfl.Or
import fr.inria.diverse.gpfl.model.gpfl.Packet
import fr.inria.diverse.gpfl.model.gpfl.Plus
import fr.inria.diverse.gpfl.model.gpfl.Policy
import fr.inria.diverse.gpfl.model.gpfl.Port
import fr.inria.diverse.gpfl.model.gpfl.PortRef
import fr.inria.diverse.gpfl.model.gpfl.Prologue
import fr.inria.diverse.gpfl.model.gpfl.Read
import fr.inria.diverse.gpfl.model.gpfl.Send
import fr.inria.diverse.gpfl.model.gpfl.SetVariable
import fr.inria.diverse.gpfl.model.gpfl.State
import fr.inria.diverse.gpfl.model.gpfl.StepAutomata
import fr.inria.diverse.gpfl.model.gpfl.Stmt
import fr.inria.diverse.gpfl.model.gpfl.StringDec
import fr.inria.diverse.gpfl.model.gpfl.StringLiteral
import fr.inria.diverse.gpfl.model.gpfl.Transition
import fr.inria.diverse.gpfl.model.gpfl.UnaryOp
import fr.inria.diverse.gpfl.model.gpfl.VariableDeclaration
import fr.inria.diverse.gpfl.model.gpfl.VariableRef

import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.PolicyAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.PortAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.PacketAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.PrologueAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.InitSeqAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.FilterAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.AutomataAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.StmtAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.CmdAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.NewAutomataAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.AlarmAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.SendAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.SetVariableAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.StepAutomataAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.NopAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.AcceptAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.DropAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.ConditionAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.IterationAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.NewInterruptionAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.StateAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.TransitionAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.BlockAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.ExpressionAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.UnaryOpAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.BinaryOpAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.PortRefAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.StringLiteralAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.IntLiteralAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.BooleanLiteralAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.NotAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.OrAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.AndAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.EqualityAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.InequalityAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.GreaterOrEqualAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.LowerOrEqualAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.GreaterAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.LowerAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.PlusAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.MinusAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.MultAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.DivAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.NegAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.VariableRefAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.VariableDeclarationAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.StringDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.BooleanDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.IntegerDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.EventAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.NewEventOccurenceAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.ReadAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.BytesDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects.BytesLiteralAspect.*

import fr.inria.diverse.k3.al.annotationprocessor.Aspect
import fr.inria.diverse.k3.al.annotationprocessor.InitializeModel
import fr.inria.diverse.k3.al.annotationprocessor.Main
import fr.inria.diverse.k3.al.annotationprocessor.Step
import java.io.File
import java.util.HashMap
import java.util.Scanner
import org.eclipse.core.resources.IWorkspace
import org.eclipse.core.resources.ResourcesPlugin
import org.eclipse.emf.common.util.EList
import java.math.BigInteger
import fr.inria.diverse.gpfl.model.gpfl.InterfaceRef
import fr.inria.diverse.gpfl.k3dsa.Gpfl.modules.MessagingModule

@Aspect(className=Policy)
class PolicyAspect {
	
	public static var endOfFilter = false
	public static var correspondingPort = new HashMap<Port, Port>()
	
	@Step
	@InitializeModel
	def void initializeModel(EList<String> args) {
		endOfFilter = false
		// ------------ Read input file and create the packets ------------ //
		_self.packets.clear
		_self.currentTime = 0
		val IWorkspace workspace = ResourcesPlugin.getWorkspace()
		try {			
			IOModule.createPacketsFromFile(_self, new File(workspace.root.findMember(args.get(0)).locationURI.path))
		} catch(NullPointerException e) {
			MessagingModule.logger.error("Input file " + args.get(0) + " not found. Go check run configurations", "Gpfl")
			e.printStackTrace
		}
		try {
			IOModule.createOutputFile(new File(workspace.root.findMember(args.get(1)).locationURI.path))
		} catch(NullPointerException e) {
			MessagingModule.logger.error("Output file " + args.get(1) + " not found. Go check run configurations", "Gpfl")
			e.printStackTrace
		}
		try {
			val portOracle = new File(workspace.root.findMember(args.get(2)).locationURI.path)
			val input = new Scanner(portOracle)
			while (input.hasNextLine) {
				val line = input.nextLine
				val sourcePort = Integer.parseInt(line.split("->").get(0).trim())
				var portIn = _self.inPorts.findFirst[p | p.number == sourcePort]
				if(portIn === null) {
					val port = GpflFactory.eINSTANCE.createPort
					port.number = sourcePort
					_self.inPorts.add(port)
					portIn = port
				}
				val destPort = Integer.parseInt(line.split("->").get(1).trim())
				var portOut = _self.inPorts.findFirst[p | p.number == destPort]
				if(portOut === null) {
					val port = GpflFactory.eINSTANCE.createPort
					port.number = destPort
					_self.inPorts.add(port)
					portOut = port
				}
				correspondingPort.put(portIn, portOut)
			}
			input.close
		} catch(NullPointerException e) {
			MessagingModule.logger.error("Output file " + args.get(2) + " not found. Go check run configurations", "Gpfl")
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
	@Step
	def void run(Policy root) {
		_self.init.run(root)
	}
}

@Aspect(className=InitSeq)
class InitSeqAspect {
	@Step
	def void run(Policy root) {
		_self.block.run(root)
	}
}

@Aspect(className=Filter)
class FilterAspect {
	@Step
	def void run(Policy root) {
		val oldTime = root.currentTime
		root.currentTime = root.currentPacket.time
		MessagingModule.logger.debug("Treatment of packet " +"("+root.currentPacket.time+";"
			+ root.currentPacket.inPort.number+";" 
			+ root.currentPacket.content + ")", "Gpfl")
		// handle interruptions
		for (interrupt : root.interruptions) {
			val nextInterrupt = Math.floor((oldTime+interrupt.time)/interrupt.time)*interrupt.time
			if ((!interrupt.loop && root.currentTime >= interrupt.time && interrupt.time > oldTime)
				|| (interrupt.loop && nextInterrupt > oldTime && nextInterrupt <= root.currentTime)
			) {			
				var i = 0
				do {
					interrupt.block.run(root)
					MessagingModule.logger.debug("Interruption @ "+(nextInterrupt+(interrupt.time*i)), "Gpfl")
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
	@Step
	def void run(Policy root) {
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
	@Step
	def void run(Policy root) {
		MessagingModule.logger.error("Statement: run of " +_self +" should never occur, please tell the developer to write a method run for this class", "Gpfl")
	}
}

@Aspect(className=Condition)
class ConditionAspect extends StmtAspect {
	@Step
	def void run(Policy root) {
		if(_self.getIf.eval(root) as Boolean) {
			_self.then.run(root)
		}
	}
}

@Aspect(className=Iteration)
class IterationAspect extends StmtAspect {
	@Step
	def void run(Policy root) {
		while (_self.getWhile.eval(root) as Boolean) {
			_self.then.run(root)
		}
	}
}

@Aspect(className=NewInterruption)
class NewInterruptionAspect extends StmtAspect {
	@Step
	def void run(Policy root) {
		root.interruptions.add(_self)
	}
}

@Aspect(className=StepAutomata)
class StepAutomataAspect extends StmtAspect {
	@Step
	def void run(Policy root) {
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
	@Step
	def void run(Policy root) {
		MessagingModule.logger.error("Command: run of " +_self +" should never occur, please tell the developer to write a method run for this class", "Gpfl")
	}
}

@Aspect(className=NewAutomata)
class NewAutomataAspect extends CmdAspect {
	@Step
	def void run(Policy root) {
		_self.currentState = _self.value.initialState
	}
}

@Aspect(className=Alarm)
class AlarmAspect extends CmdAspect {
	@Step
	def void run(Policy root) {
		MessagingModule.logger.error("ALARM @ "+ root.currentTime+ ": " + _self.message.eval(root) as String, "Gpfl")
	}
}

@Aspect(className=Send)
class SendAspect extends CmdAspect {
	@Step
	def void run(Policy root) {
		var packet = "("+root.currentTime+";"
			+ _self.port.number+";" 
			+ _self.packet.content + ")"
		MessagingModule.logger.debug("SEND " + packet, "Gpfl")
		
		IOModule.writePacket(_self.packet, _self.port)
		endOfFilter = true
	}
}

@Aspect(className=SetVariable)
class SetVariableAspect extends CmdAspect {
	@Step
	def void run(Policy root) {
		val value = _self.value.eval(root)
		if (_self.declaration instanceof VariableDeclaration){	
			var variable = root.variables.findFirst[v | v.name.equals(_self.declaration.name)]
			// If the variable already has been initialized
			// just change the value
			if(variable instanceof BytesDec) {
				variable.value = value as BigInteger
			} else if (variable instanceof IntegerDec) {
				// if there is an implicit cast from int to bits
				if (value instanceof BigInteger) {
					root.variables.remove(variable)
					var newVar = GpflFactory.eINSTANCE.createBytesDec
					newVar.name = _self.declaration.name
					newVar.value = value
					root.variables.add(newVar)
				} else
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
				} else if (value instanceof BigInteger) {
					var newVar = GpflFactory.eINSTANCE.createBytesDec
					newVar.name = _self.declaration.name
					newVar.value = value
					root.variables.add(newVar)
				} else if (value instanceof String) {
					var newVar = GpflFactory.eINSTANCE.createStringDec
					newVar.name = _self.declaration.name
					newVar.value = value
					root.variables.add(newVar)
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
	@Step
	def void run(Policy root) { }
}

@Aspect(className=Accept)
class AcceptAspect extends CmdAspect {
	@Step
	def void run(Policy root) {
		MessagingModule.logger.debug("ACCEPT\n", "Gpfl")
		
		IOModule.writePacket(root.currentPacket, correspondingPort.get(root.currentPacket.inPort))
		endOfFilter = true
	}
}

@Aspect(className=Drop)
class DropAspect extends CmdAspect {
	@Step
	def void run(Policy root) {
		MessagingModule.logger.debug("DROP\n", "Gpfl")
		endOfFilter = true
	}
}

@Aspect(className=NewEventOccurence)
class NewEventOccurenceAspect extends CmdAspect {
	@Step
	def void run(Policy root) {
		var eventOcc = GpflFactory.eINSTANCE.createEventOccurence
		eventOcc.name = _self.occurence.name
		eventOcc.event = _self.value
		root.prologue.eventPool.add(eventOcc)
	}
}

// --------------- EXPRESSION  --------------- //

@Aspect(className=Expression)
abstract class ExpressionAspect {
	def Object eval(Policy root) {
		MessagingModule.logger.error("Expression: eval of " + _self + " should never occur, please tell the developer to write a method run for this class", "Gpfl")
		return null;
	}
}


@Aspect(className=VariableRef)
class VariableRefAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		return root.variables.findFirst[v | v.name.equals(_self.variable.name)].eval(root)
	}
}

@Aspect(className=PortRef)
class PortRefAspect extends ExpressionAspect {
	// a port ref can be called only to check if it's the current port, so it's a boolean
	def Object eval(Policy root) {
		return root.currentPacket.inPort.equals(_self.port)
	}
}

@Aspect(className=InterfaceRef)
class InterfaceRefAspect extends ExpressionAspect {
	// a port ref can be called only to check if it's the current port, so it's a boolean
	def Object eval(Policy root) {
		return root.currentPacket.inPort.interface.equals(_self.interface)
	}
}

@Aspect(className=StringLiteral)
class StringLiteralAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		return _self.value
	}
}

@Aspect(className=IntLiteral)
class IntLiteralAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		return _self.value
	}
}

@Aspect(className=BooleanLiteral)
class BooleanLiteralAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		return _self.isIsTrue
	}
}

@Aspect(className=BytesLiteral)
class BytesLiteralAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		// if it's an hex convert to bin string
		return _self.value.startsWith("0x") ?
			new BigInteger(_self.value.substring(2), 16)
			: new BigInteger(_self.value.substring(2), 2)
	}
}

@Aspect(className=Read)
class ReadAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		var offset = _self.offset.eval(root)
		var length = _self.length.eval(root)
		try {
			if (offset instanceof BigInteger) offset = offset.intValue();
			if (length instanceof BigInteger) length = length.intValue();
			return new BigInteger(root.currentPacket.content.toString.substring(offset as Integer, offset as Integer + length as Integer), 2)
		} catch(StringIndexOutOfBoundsException e) {
			MessagingModule.logger.error("Trying to read from " + offset 
				+ " to " + (offset as Integer + length as Integer) 
				+ " on a packet of size " + root.currentPacket.content.length
				, "Gpfl"
			)
			return null
		}
	}
}

@Aspect(className=UnaryOp)
abstract class UnaryOpAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		MessagingModule.logger.error("Unary op: eval of " + _self + " should never occur, please tell the developer to write a method run for this class", "Gpfl")
		return null
	}
}

@Aspect(className=Not)
class NotAspect extends UnaryOpAspect {
	def Object eval(Policy root) {
		val expr = _self.expression.eval(root)
		try {
			return !(expr as Boolean)
		} catch (ClassCastException e) {
			MessagingModule.logger.error("Type mismatch: Cannot invert " + expr + " because it's not a boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Neg)
class NegAspect extends UnaryOpAspect {
	def Object eval(Policy root) {
		val expr = _self.expression.eval(root)
		try {
			return -(expr as Integer)
		} catch (ClassCastException e) {
			MessagingModule.logger.error("Type mismatch: Cannot neg " + expr + " because it's not an integer", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=BinaryOp)
abstract class BinaryOpAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		MessagingModule.logger.error("Binary op: eval of " + _self + " should never occur, please tell the developer to write a method run for this class", "Gpfl")
		return null
	}
}

@Aspect(className=Or)
class OrAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		try {
			return (left as Boolean) || (right as Boolean)
		} catch (ClassCastException e) {
			MessagingModule.logger.error("Type mismatch: Cannot compare (|) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=And)
class AndAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		try {
			return (left as Boolean) && (right as Boolean)
		} catch (ClassCastException e) {
			MessagingModule.logger.error("Type mismatch: Cannot compare (&) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Equality)
class EqualityAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		var left = _self.left.eval(root)
		var right = _self.right.eval(root)
		try {
			if(left instanceof BigInteger && right instanceof Integer) right = BigInteger.valueOf(right as Integer)
			else if(right instanceof BigInteger && left instanceof Integer) left = BigInteger.valueOf(left as Integer)
			return left.equals(right)
		} catch (ClassCastException e) {
			MessagingModule.logger.error("Type mismatch: Cannot compare (==) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Inequality)
class InequalityAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		var left = _self.left.eval(root)
		var right = _self.right.eval(root)
		try {
			if(left instanceof BigInteger && right instanceof Integer) right = BigInteger.valueOf(right as Integer)
			else if(right instanceof BigInteger && left instanceof Integer) left = BigInteger.valueOf(left as Integer)
			return !left.equals(right)
		} catch (ClassCastException e) {
			MessagingModule.logger.error("Type mismatch: Cannot compare (!=) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=GreaterOrEqual)
class GreaterOrEqualAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		var left = _self.left.eval(root)
		var right = _self.right.eval(root)
		if (left instanceof String && right instanceof String) {
			return (left as String).compareTo(right as String) >= 0 ? true : false
		} else if (left instanceof Number && left instanceof Number) {
			return ((left as Number).longValue()) >= ((right as Number).longValue())
		} else {
			MessagingModule.logger.error("Type mismatch: Cannot compare (>=) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
			return null
		}
	}
}

@Aspect(className=LowerOrEqual)
class LowerOrEqualAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof String && right instanceof String) {
			return (left as String).compareTo(right as String) <= 0 ? true : false
		} else if (left instanceof Number && left instanceof Number) {
			return ((left as Number).longValue()) <= ((right as Number).longValue())
		} else {
			MessagingModule.logger.error("Type mismatch: Cannot compare (<=) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
			return null
		}
	}
}

@Aspect(className=Greater)
class GreaterAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof String && right instanceof String) {
			return (left as String).compareTo(right as String) > 0 ? true : false
		} else if (left instanceof Number && left instanceof Number) {
			return ((left as Number).longValue()) > ((right as Number).longValue())
		} else {
			MessagingModule.logger.error("Type mismatch: Cannot compare (>) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
			return null
		}
	}
}

@Aspect(className=Lower)
class LowerAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (left instanceof String && right instanceof String) {
			return (left as String).compareTo(right as String) < 0 ? true : false
		} else if (left instanceof Number && left instanceof Number) {
			return ((left as Number).longValue()) < ((right as Number).longValue())
		} else {
			MessagingModule.logger.error("Type mismatch: Cannot compare (<) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
			return null
		}
	}
}

@Aspect(className=Plus)
class PlusAspect extends BinaryOpAspect {
	// we can add two numbers and concatenate two strings
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if(left instanceof BigInteger && right instanceof Integer) return (left as BigInteger) + (BigInteger.valueOf(right as Integer))
		else if(right instanceof BigInteger && left instanceof Integer) return (BigInteger.valueOf(left as Integer)) + (right as BigInteger) 
		if ((left instanceof Integer && right instanceof Integer)
			|| (left instanceof String && right instanceof String)
		) {
			return (left as Integer) + (right as Integer)
		} else if (left instanceof String) {
			return (left as String) + right
		} else if (right instanceof String) {
			return left + (right as String)
		}
		MessagingModule.logger.error("Type mismatch: Cannot add " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
		return null
	}
}

@Aspect(className=Minus)
class MinusAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if(left instanceof BigInteger && right instanceof Integer) return (left as BigInteger) - (BigInteger.valueOf(right as Integer))
		else if(right instanceof BigInteger && left instanceof Integer) return (BigInteger.valueOf(left as Integer)) - (right as BigInteger) 
		MessagingModule.logger.error("Type mismatch: Cannot minus " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
		return null
	}
}

@Aspect(className=Mult)
class MultAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		var left = _self.left.eval(root)
		var right = _self.right.eval(root)
		if(left instanceof BigInteger && right instanceof Integer) return (left as BigInteger) * (BigInteger.valueOf(right as Integer))
		else if(right instanceof BigInteger && left instanceof Integer) return (right as BigInteger) * (BigInteger.valueOf(left as Integer))
		MessagingModule.logger.error("Type mismatch: Cannot multiply " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
		return null
	}
}

@Aspect(className=Div)
class DivAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		if (right == 0) {
			MessagingModule.logger.error("You cannot divide by 0", "Gpfl")
			return null
		}
		if(left instanceof BigInteger && right instanceof Integer) return (left as BigInteger) / (BigInteger.valueOf(right as Integer))
		else if(right instanceof BigInteger && left instanceof Integer) return (BigInteger.valueOf(left as Integer)) / (right as BigInteger) 
		MessagingModule.logger.error("Type mismatch: Cannot divide " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")"
			, "Gpfl")
		return null
	}
}

@Aspect(className=VariableDeclaration)
class VariableDeclarationAspect {
	def Object eval(Policy root) {
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
	def Object eval(Policy root) {
		return _self.value
	}
}

@Aspect(className=BooleanDec)
class BooleanDecAspect extends VariableDeclarationAspect {
	def Object eval(Policy root) {
		return _self.isTrue
	}
}

@Aspect(className=IntegerDec)
class IntegerDecAspect extends VariableDeclarationAspect {
	def Object eval(Policy root) {
		return _self.value
	}
}

@Aspect(className=BytesDec)
class BytesDecAspect extends VariableDeclarationAspect {
	def Object eval(Policy root) {
		return _self.value
	}
}

@Aspect(className=Port)
class PortAspect {

}

@Aspect(className=Packet)
class PacketAspect {

}
