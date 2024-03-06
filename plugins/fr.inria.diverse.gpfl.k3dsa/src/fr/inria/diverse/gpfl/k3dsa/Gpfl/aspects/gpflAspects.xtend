package fr.inria.diverse.gpfl.k3dsa.Gpfl.aspects

import fr.inria.diverse.gpfl.k3dsa.Gpfl.modules.GpflMessagingModule
import fr.inria.diverse.gpfl.k3dsa.Gpfl.modules.IOModule
import fr.inria.diverse.gpfl.model.Gpfl.Accept
import fr.inria.diverse.gpfl.model.Gpfl.Alarm
import fr.inria.diverse.gpfl.model.Gpfl.And
import fr.inria.diverse.gpfl.model.Gpfl.Automata
import fr.inria.diverse.gpfl.model.Gpfl.BinaryOp
import fr.inria.diverse.gpfl.model.Gpfl.Block
import fr.inria.diverse.gpfl.model.Gpfl.BooleanDec
import fr.inria.diverse.gpfl.model.Gpfl.BooleanLiteral
import fr.inria.diverse.gpfl.model.Gpfl.BytesDec
import fr.inria.diverse.gpfl.model.Gpfl.BytesLiteral
import fr.inria.diverse.gpfl.model.Gpfl.Cmd
import fr.inria.diverse.gpfl.model.Gpfl.Condition
import fr.inria.diverse.gpfl.model.Gpfl.Div
import fr.inria.diverse.gpfl.model.Gpfl.Drop
import fr.inria.diverse.gpfl.model.Gpfl.Equality
import fr.inria.diverse.gpfl.model.Gpfl.Event
import fr.inria.diverse.gpfl.model.Gpfl.Expression
import fr.inria.diverse.gpfl.model.Gpfl.Filter
import fr.inria.diverse.gpfl.model.Gpfl.GpflFactory
import fr.inria.diverse.gpfl.model.Gpfl.Greater
import fr.inria.diverse.gpfl.model.Gpfl.GreaterOrEqual
import fr.inria.diverse.gpfl.model.Gpfl.Inequality
import fr.inria.diverse.gpfl.model.Gpfl.InitSeq
import fr.inria.diverse.gpfl.model.Gpfl.IntLiteral
import fr.inria.diverse.gpfl.model.Gpfl.IntegerDec
import fr.inria.diverse.gpfl.model.Gpfl.Iteration
import fr.inria.diverse.gpfl.model.Gpfl.Lower
import fr.inria.diverse.gpfl.model.Gpfl.LowerOrEqual
import fr.inria.diverse.gpfl.model.Gpfl.Minus
import fr.inria.diverse.gpfl.model.Gpfl.Mult
import fr.inria.diverse.gpfl.model.Gpfl.Neg
import fr.inria.diverse.gpfl.model.Gpfl.NewAutomata
import fr.inria.diverse.gpfl.model.Gpfl.NewEventOccurence
import fr.inria.diverse.gpfl.model.Gpfl.NewInterruption
import fr.inria.diverse.gpfl.model.Gpfl.Nop
import fr.inria.diverse.gpfl.model.Gpfl.Not
import fr.inria.diverse.gpfl.model.Gpfl.Or
import fr.inria.diverse.gpfl.model.Gpfl.Packet
import fr.inria.diverse.gpfl.model.Gpfl.Plus
import fr.inria.diverse.gpfl.model.Gpfl.Policy
import fr.inria.diverse.gpfl.model.Gpfl.Port
import fr.inria.diverse.gpfl.model.Gpfl.PortRef
import fr.inria.diverse.gpfl.model.Gpfl.Prologue
import fr.inria.diverse.gpfl.model.Gpfl.Read
import fr.inria.diverse.gpfl.model.Gpfl.Send
import fr.inria.diverse.gpfl.model.Gpfl.SetVariable
import fr.inria.diverse.gpfl.model.Gpfl.State
import fr.inria.diverse.gpfl.model.Gpfl.StepAutomata
import fr.inria.diverse.gpfl.model.Gpfl.Stmt
import fr.inria.diverse.gpfl.model.Gpfl.StringDec
import fr.inria.diverse.gpfl.model.Gpfl.StringLiteral
import fr.inria.diverse.gpfl.model.Gpfl.Transition
import fr.inria.diverse.gpfl.model.Gpfl.UnaryOp
import fr.inria.diverse.gpfl.model.Gpfl.VariableDeclaration
import fr.inria.diverse.gpfl.model.Gpfl.VariableRef

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
import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystem
import java.math.BigInteger
import fr.inria.diverse.gpfl.model.Gpfl.InterfaceRef

@Aspect(className=Policy)
class PolicyAspect {
	def MessagingSystem logger() {
		GpflMessagingModule.logger
	}
	
	public static var endOfFilter = false
	public static var correspondingPort = new HashMap<Port, Port>()
	
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
			GpflMessagingModule.logger.error("Input file " + args.get(0) + " not found. Go check run configurations", "Gpfl")
			e.printStackTrace
		}
		try {
			IOModule.createOutputFile(new File(workspace.root.findMember(args.get(1)).locationURI.path))
		} catch(NullPointerException e) {
			GpflMessagingModule.logger.error("Output file " + args.get(1) + " not found. Go check run configurations", "Gpfl")
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
			GpflMessagingModule.logger.error("Output file " + args.get(2) + " not found. Go check run configurations", "Gpfl")
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
	def void run(Policy root) {
		_self.init.run(root)
	}
}

@Aspect(className=InitSeq)
class InitSeqAspect {
	def void run(Policy root) {
		_self.block.run(root)
	}
}

@Aspect(className=Filter)
class FilterAspect {
	def void run(Policy root) {
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
	def void run(Policy root) {
		root.logger.error("Statement: run of " +_self +" should never occur, please tell the developer to write a method run for this class", "Gpfl")
	}
}

@Aspect(className=Condition)
class ConditionAspect extends StmtAspect {
	def void run(Policy root) {
		if(_self.getIf.eval(root) as Boolean) {
			_self.then.run(root)
		}
	}
}

@Aspect(className=Iteration)
class IterationAspect extends StmtAspect {
	def void run(Policy root) {
		while (_self.getWhile.eval(root) as Boolean) {
			_self.then.run(root)
		}
	}
}

@Aspect(className=NewInterruption)
class NewInterruptionAspect extends StmtAspect {
	def void run(Policy root) {
		root.interruptions.add(_self)
	}
}

@Aspect(className=StepAutomata)
class StepAutomataAspect extends StmtAspect {
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
	def void run(Policy root) {
		root.logger.error("Command: run of " +_self +" should never occur, please tell the developer to write a method run for this class", "Gpfl")
	}
}

@Aspect(className=NewAutomata)
class NewAutomataAspect extends CmdAspect {
	def void run(Policy root) {
		_self.currentState = _self.value.initialState
	}
}

@Aspect(className=Alarm)
class AlarmAspect extends CmdAspect {
	def void run(Policy root) {
		root.logger.error("ALARM @ "+ root.currentTime+ ": " + _self.message.eval(root) as String, "Gpfl")
	}
}

@Aspect(className=Send)
class SendAspect extends CmdAspect {
	def void run(Policy root) {
		var packet = "("+root.currentTime+";"
			+ _self.port.number+";" 
			+ _self.packet.content + ")"
		root.logger.debug("SEND " + packet, "Gpfl")
		
		IOModule.writePacket(_self.packet, _self.port)
		endOfFilter = true
	}
}

@Aspect(className=SetVariable)
class SetVariableAspect extends CmdAspect {
	def void run(Policy root) {
		val value = _self.value.eval(root)
		if (_self.declaration instanceof VariableDeclaration){	
			var variable = root.variables.findFirst[v | v.name.equals(_self.declaration.name)]
			// If the variable already has been initialized
			// just change the value
			if(variable instanceof BytesDec) {
				variable.value = value as BigInteger
			} else if (variable instanceof IntegerDec) {
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
	def void run(Policy root) { }
}

@Aspect(className=Accept)
class AcceptAspect extends CmdAspect {
	def void run(Policy root) {
		var packet = "("+root.currentTime+";"
			+ correspondingPort.get(root.currentPacket.inPort).number+";" 
			+ root.currentPacket.content + ")"
		root.logger.debug("ACCEPT " + packet, "Gpfl")
		
		IOModule.writePacket(root.currentPacket, correspondingPort.get(root.currentPacket.inPort))
		endOfFilter = true
	}
}

@Aspect(className=Drop)
class DropAspect extends CmdAspect {
	def void run(Policy root) {
		var packet = "("+root.currentTime+";"
			+ root.currentPacket.inPort.number
			+";"+root.currentPacket.content+")"
		root.logger.debug("DROP " + packet, "Gpfl")
		endOfFilter = true
	}
}

@Aspect(className=NewEventOccurence)
class NewEventOccurenceAspect extends CmdAspect {
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
		root.logger.error("Expression: eval of " + _self + " should never occur, please tell the developer to write a method run for this class", "Gpfl")
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
		val offset = _self.offset.eval(root) as Integer
		val length = _self.length.eval(root) as Integer
		return new BigInteger(root.currentPacket.content.toString.substring(offset, offset+length), 2)
	}
}

@Aspect(className=UnaryOp)
abstract class UnaryOpAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		root.logger.error("Unary op: eval of " + _self + " should never occur, please tell the developer to write a method run for this class", "Gpfl")
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
			root.logger.error("Type mismatch: Cannot invert " + expr + " because it's not a boolean", "Gpfl")
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
			root.logger.error("Type mismatch: Cannot neg " + expr + " because it's not an integer", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=BinaryOp)
abstract class BinaryOpAspect extends ExpressionAspect {
	def Object eval(Policy root) {
		root.logger.error("Binary op: eval of " + _self + " should never occur, please tell the developer to write a method run for this class", "Gpfl")
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
			root.logger.error("Type mismatch: Cannot compare (|) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")", "Gpfl"
			)
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
			root.logger.error("Type mismatch: Cannot compare (&) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")", "Gpfl"
			)
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Equality)
class EqualityAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		try {
			return left.equals(right)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare (==) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")", "Gpfl"
			)
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Inequality)
class InequalityAspect extends BinaryOpAspect {
	def Object eval(Policy root) {
		val left = _self.left.eval(root)
		val right = _self.right.eval(root)
		try {
			return !left.equals(right)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare (!=) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")", "Gpfl"
			)
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
			root.logger.error("Type mismatch: Cannot compare (>=) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")", "Gpfl"
			)
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
			root.logger.error("Type mismatch: Cannot compare (<=) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")", "Gpfl"
			)
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
			root.logger.error("Type mismatch: Cannot compare (>) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")", "Gpfl"
			)
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
			root.logger.error("Type mismatch: Cannot compare (<) " + left + "("+left?.class+")"
				+ " and " + right + "("+right?.class+")", "Gpfl"
			)
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
	def Object eval(Policy root) {
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
	def Object eval(Policy root) {
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
	def Object eval(Policy root) {
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
