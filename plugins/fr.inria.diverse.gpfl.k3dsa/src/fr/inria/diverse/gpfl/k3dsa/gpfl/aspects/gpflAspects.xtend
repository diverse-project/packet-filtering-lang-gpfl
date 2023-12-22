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
import fr.inria.diverse.gpfl.Field
import fr.inria.diverse.gpfl.FieldRef
import fr.inria.diverse.gpfl.Event
import fr.inria.diverse.gpfl.SetType
import fr.inria.diverse.gpfl.NewEventOccurence

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
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.FieldRefAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.EventAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.NewEventOccurenceAspect.*

import fr.inria.diverse.k3.al.annotationprocessor.Main
import fr.inria.diverse.k3.al.annotationprocessor.InitializeModel
import org.eclipse.emf.common.util.EList
import fr.inria.diverse.gpfl.GpflFactory
import fr.inria.diverse.gpfl.Program
import java.io.File
import java.util.Scanner
import org.eclipse.core.resources.ResourcesPlugin
import org.eclipse.core.resources.IWorkspace
import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystem
import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystemManager

@Aspect(className=Program)
class ProgramAspect {
	var MessagingSystem internalLogger  
	def MessagingSystem logger(){
		if (_self.internalLogger === null) { 
			val MessagingSystemManager msManager = new MessagingSystemManager
			_self.internalLogger = msManager.createBestPlatformMessagingSystem("Gpfl","Simple Gpfl interpreter")
			
		} 
		return _self.internalLogger
	}
	@InitializeModel
	def void initializeModel(EList<String> args) {
		
		// ------------ Read input file and create the packets ------------ //
		try {
			val IWorkspace workspace = ResourcesPlugin.getWorkspace()
			val input = new Scanner(new File(workspace.root.findMember(args.get(0)).locationURI.path))
			while (input.hasNextLine) {
				val line = input.nextLine
				var packet = GpflFactory.eINSTANCE.createPacket
				val String[] packet_data = line.substring(1, line.length-1).split(";")
				packet.time = Integer.valueOf(packet_data.get(0))
				packet.inPort = _self.inPorts.findFirst[p | p.name.equals(packet_data.get(1))]
				for (field_data : packet_data.get(2).split(",")) {
					val field = GpflFactory.eINSTANCE.createField
					field.name = "$"+field_data.substring(0, field_data.indexOf("="))
					field.value = field_data.split('"').get(1)
					packet.fields.add(field)
				}
				_self.packets.add(packet)
			}
		} catch(NullPointerException e) {
			_self.logger.error("Input file " + args.get(0) + " not found\nGo check run configurations", "Gpfl")
			e.printStackTrace();
		}
	}
	
	@Main
	def void run() {
 		_self.prologue.run(_self)
 		_self.filter.run(_self)
	}
}

@Aspect(className=Prologue)
class PrologueAspect {
	def void run(Program root) {
		_self.init.run(root)
	}
}

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

@Aspect(className=InitSeq)
class InitSeqAspect {
	def void run(Program root) {
		_self.block.run(root)
	}
}

@Aspect(className=Filter)
class FilterAspect {
	def void run(Program root) {
		_self.block.run(root)
	}
}

@Aspect(className=Block)
class BlockAspect {
	def void run(Program root) {
		_self.currentStmt = _self.firstStmt
		while (_self.currentStmt !== null) {
			_self.currentStmt.run(root)
			_self.currentStmt = _self.currentStmt.next
		}
	}
}

@Aspect(className=Stmt)
abstract class StmtAspect {
	def void run(Program root) {
		root.logger.error("run of " +_self +" should never occur, please write method run for this class", "Gpfl")
	}
}

@Aspect(className=Condition)
class ConditionAspect extends StmtAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=Iteration)
class IterationAspect extends StmtAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=NewInterruption)
class NewInterruptionAspect extends StmtAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=StepAutomata)
class StepAutomataAspect extends StmtAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=Cmd)
abstract class CmdAspect extends StmtAspect {
	def void run(Program root) {
		root.logger.error("run of " +_self +" should never occur, please write method run for this class", "Gpfl")
	}
}

@Aspect(className=NewAutomata)
class NewAutomataAspect extends CmdAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=Alarm)
class AlarmAspect extends CmdAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=Send)
class SendAspect extends CmdAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=SetVariable)
class SetVariableAspect extends CmdAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=Nop)
class NopAspect extends CmdAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=Accept)
class AcceptAspect extends CmdAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=Drop)
class DropAspect extends CmdAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=NewEventOccurence)
class NewEventOccurenceAspect extends CmdAspect {
	def void run(Program root) {
		root.logger.debug(_self +" not implemented yet", "Gpfl")
	}
}

@Aspect(className=Expression)
abstract class ExpressionAspect {
	def Object eval(Program root) {
		root.logger.error("eval of " + _self + " should never occur, please write method run for this class", "Gpfl")
		return 0;
	}
}


@Aspect(className=VariableRef)
class VariableRefAspect extends ExpressionAspect {
	def Object eval(Program root) {
//		return _self.variable.eval(root)
	}
}

@Aspect(className=FieldRef)
class FieldRefAspect extends ExpressionAspect {
	def Object eval(Program root) {
//		return _self.field.eval(root)
	}
}

@Aspect(className=PortRef)
class PortRefAspect extends ExpressionAspect {
	// a port ref can be called only to check if it's the current port, so it's a boolean
	def Boolean eval(Program root) {
		return root.currentPacket.inPort === _self.port
	}
}

@Aspect(className=StringLiteral)
class StringLiteralAspect extends ExpressionAspect {
	def String eval(Program root) {
		return _self.value
	}
}

@Aspect(className=IntLiteral)
class IntLiteralAspect extends ExpressionAspect {
	def Integer eval(Program root) {
		return _self.value
	}
}

@Aspect(className=BooleanLiteral)
class BooleanLiteralAspect extends ExpressionAspect {
	def Boolean eval(Program root) {
		return _self.isIsTrue
	}
}

@Aspect(className=UnaryOp)
abstract class UnaryOpAspect extends ExpressionAspect {
	def Object eval(Program root) {
		root.logger.error("eval of " + _self + " should never occur, please write method run for this class", "Gpfl")
		return null
	}
}

@Aspect(className=Not)
class NotAspect extends UnaryOpAspect {
	def Boolean eval(Program root) {
		try {
			return !(_self.expression.eval(root) as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot invert " + _self.expression.eval(root) + " because it's not a boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Neg)
class NegAspect extends UnaryOpAspect {
	def Integer eval(Program root) {
		try {
			return -(_self.expression.eval(root) as Integer)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot neg " + _self.expression.eval(root) + " because it's not an integer", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=BinaryOp)
abstract class BinaryOpAspect extends ExpressionAspect {
	def Object eval(Program root) {
		root.logger.error("eval of " + _self + " should never occur, please write method run for this class", "Gpfl")
		return null
	}
}

@Aspect(className=Or)
class OrAspect extends BinaryOpAspect {
	def Boolean eval(Program root) {
		try {
			return (_self.left.eval(root) as Boolean) || (_self.right.eval(root) as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot evaluate " + _self.left.eval(root) + " and " + _self.right.eval(root) + " because they are not Boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=And)
class AndAspect extends BinaryOpAspect {
	def Boolean eval(Program root) {
		try {
			return (_self.left.eval(root) as Boolean) && (_self.right.eval(root) as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot evaluate " + _self.left.eval(root) + " and " + _self.right.eval(root) + " because they are not Boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Equality)
class EqualityAspect extends BinaryOpAspect {
	def Boolean eval(Program root) {
		try {
			return (_self.left.eval(root) as Boolean) == (_self.right.eval(root) as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare " + _self.left.eval(root) + " and " + _self.right.eval(root) + " because they are not Boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Inequality)
class InequalityAspect extends BinaryOpAspect {
	def Boolean eval(Program root) {
		try {
			return (_self.left.eval(root) as Boolean) != (_self.right.eval(root) as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare " + _self.left.eval(root) + " and " + _self.right.eval(root) + " because they are not Boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=GreaterOrEqual)
class GreaterOrEqualAspect extends BinaryOpAspect {
	def Boolean eval(Program root) {
		try {
			return (_self.left.eval(root) as Boolean) >= (_self.right.eval(root) as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare " + _self.left.eval(root) + "and" + _self.right.eval(root) + " because they are not Boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=LowerOrEqual)
class LowerOrEqualAspect extends BinaryOpAspect {
	def Boolean eval(Program root) {
		try {
			return (_self.left.eval(root) as Boolean) <= (_self.right.eval(root) as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare " + _self.left.eval(root) + " and " + _self.right.eval(root) + " because they are not Boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Greater)
class GreaterAspect extends BinaryOpAspect {
	def Boolean eval(Program root) {
		try {
			return (_self.left.eval(root) as Boolean) > (_self.right.eval(root) as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare " + _self.left.eval(root) + " and " + _self.right.eval(root) + " because they are not Boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Lower)
class LowerAspect extends BinaryOpAspect {
	def Boolean eval(Program root) {
		try {
			return (_self.left.eval(root) as Boolean) < (_self.right.eval(root) as Boolean)
		} catch (ClassCastException e) {
			root.logger.error("Type mismatch: Cannot compare " + _self.left.eval(root) + " and " + _self.right.eval(root) + " because they are not Boolean", "Gpfl")
			e.printStackTrace
			return null
		}
	}
}

@Aspect(className=Plus)
class PlusAspect extends BinaryOpAspect {
	def Object eval(Program root) {
		if (_self.left.eval(root) instanceof Integer && _self.right.eval(root) instanceof Integer) {
			return (_self.left.eval(root) as Integer) + (_self.right.eval(root) as Integer)
		} else if (_self.left.eval(root) instanceof String) {
			return (_self.left.eval(root) as String) + _self.right.eval(root)
		} else if (_self.right.eval(root) instanceof String) {
			return _self.left.eval(root) + (_self.right.eval(root) as String)
		}
		root.logger.error("Type mismatch: Cannot add " + _self.left.eval(root) + " and " + _self.right.eval(root), "Gpfl")
		return null
	}
}

@Aspect(className=Minus)
class MinusAspect extends BinaryOpAspect {
	def Integer eval(Program root) {
		if (_self.left.eval(root) instanceof Integer && _self.right.eval(root) instanceof Integer) {
			return (_self.left.eval(root) as Integer) - (_self.right.eval(root) as Integer)
		}
		root.logger.error("Type mismatch: Cannot minus " + _self.left.eval(root) + " by " + _self.right.eval(root), "Gpfl")
		return null
	}
}

@Aspect(className=Mult)
class MultAspect extends BinaryOpAspect {
	def Integer eval(Program root) {
		if (_self.left.eval(root) instanceof Integer && _self.right.eval(root) instanceof Integer) {
			return (_self.left.eval(root) as Integer) * (_self.right.eval(root) as Integer)
		}
		root.logger.error("Type mismatch: Cannot multiply " + _self.left.eval(root) + " by " + _self.right.eval(root), "Gpfl")
		return null
	}
}

@Aspect(className=Div)
class DivAspect extends BinaryOpAspect {
	def Integer eval(Program root) {
		if (_self.left.eval(root) instanceof Integer && _self.right.eval(root) instanceof Integer) {
			if (_self.right.eval(root) == 0) {
				root.logger.error("You cannot divide by 0", "Gpfl")
				return null
			}
			return (_self.left.eval(root) as Integer) - (_self.right.eval(root) as Integer)
		}
		root.logger.error("Type mismatch: Cannot divid " + _self.left.eval(root) + " by " + _self.right.eval(root), "Gpfl")
		return null
	}
}

@Aspect(className=SetType)
class SetTypeAspect {

}

@Aspect(className=VariableDeclaration)
class VariableDeclarationAspect extends SetTypeAspect {

}

@Aspect(className=StringDec)
class StringDecAspect extends VariableDeclarationAspect {

}

@Aspect(className=BooleanDec)
class BooleanDecAspect extends VariableDeclarationAspect {

}

@Aspect(className=IntegerDec)
class IntegerDecAspect extends VariableDeclarationAspect {

}

@Aspect(className=Port)
class PortAspect {

}

@Aspect(className=Packet)
class PacketAspect {

}

@Aspect(className=Field)
class FieldAspect extends SetTypeAspect{

}