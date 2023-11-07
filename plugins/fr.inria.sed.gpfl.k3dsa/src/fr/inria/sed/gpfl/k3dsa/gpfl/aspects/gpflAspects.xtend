package fr.inria.sed.gpfl.k3dsa.gpfl.aspects

import fr.inria.sed.gpfl.Program
import fr.inria.sed.gpfl.ProloguesElt
import fr.inria.sed.gpfl.InitSeq
import fr.inria.sed.gpfl.AutomataDef
import fr.inria.sed.gpfl.AutomataDefTail
import fr.inria.sed.gpfl.ATransition
import fr.inria.sed.gpfl.Node
import fr.inria.sed.gpfl.Fields
import fr.inria.sed.gpfl.Stmt
import fr.inria.sed.gpfl.Cmd
import fr.inria.sed.gpfl.Expression
import fr.inria.sed.gpfl.Or
import fr.inria.sed.gpfl.And
import fr.inria.sed.gpfl.Equality
import fr.inria.sed.gpfl.Plus
import fr.inria.sed.gpfl.Minus
import fr.inria.sed.gpfl.Not
import fr.inria.sed.gpfl.IntConstant
import fr.inria.sed.gpfl.StringConstant
import fr.inria.sed.gpfl.BoolConstant
import fr.inria.sed.gpfl.PortConstant
import fr.inria.sed.gpfl.BuiltInIdConstant
import fr.inria.sed.gpfl.FieldIdConstant
import fr.inria.sed.gpfl.AutomatonIdConstant
import fr.inria.sed.gpfl.AVarId
import fr.inria.sed.gpfl.NewAutomata
import fr.inria.sed.gpfl.Inequality
import fr.inria.sed.gpfl.Greater
import fr.inria.sed.gpfl.Lower
import fr.inria.sed.gpfl.GreaterOrEqual
import fr.inria.sed.gpfl.LowerOrEqual
import fr.inria.sed.gpfl.Mult
import fr.inria.sed.gpfl.Div
import fr.inria.sed.gpfl.Condition
import fr.inria.sed.gpfl.Iteration
import fr.inria.sed.gpfl.NewInterruption
import fr.inria.sed.gpfl.Nop
import fr.inria.sed.gpfl.Accept
import fr.inria.sed.gpfl.Drop
import fr.inria.sed.gpfl.Send
import fr.inria.sed.gpfl.Alarm
import fr.inria.sed.gpfl.Set
import fr.inria.sed.gpfl.StepAutomata

import fr.inria.diverse.k3.al.annotationprocessor.Main
import fr.inria.diverse.k3.al.annotationprocessor.Step
import fr.inria.diverse.k3.al.annotationprocessor.InitializeModel
import fr.inria.diverse.k3.al.annotationprocessor.Aspect

import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.ProgramAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.ProloguesEltAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.InitSeqAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.AutomataDefAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.AutomataDefTailAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.ATransitionAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.NodeAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.FieldsAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.StmtAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.ConditionAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.IterationAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.NewInterruptionAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.CmdAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.NopAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.AcceptAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.DropAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.SendAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.AlarmAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.SetAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.NewAutomataAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.StepAutomataAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.ExpressionAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.OrAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.AndAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.EqualityAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.PlusAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.MinusAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.NotAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.IntConstantAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.StringConstantAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.BoolConstantAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.PortConstantAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.BuiltInIdConstantAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.FieldIdConstantAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.AutomatonIdConstantAspect.*
import static extension fr.inria.sed.gpfl.k3dsa.gpfl.aspects.AVarIdAspect.*

import static extension fr.inria.sed.gpfl.k3dsa.gpfl.vm.aspects.InterpreterRuntimeContextAspect.*

import fr.inria.sed.gpfl.vm.model.vm.VmFactory
import fr.inria.sed.gpfl.vm.model.vm.InterpreterRuntimeContext
import fr.inria.sed.gpfl.vm.model.vm.Automata
import fr.inria.sed.gpfl.vm.model.vm.ParamMap

import org.eclipse.emf.common.util.EList
import java.io.File
import java.util.Scanner
import java.io.FileNotFoundException

@Aspect(className=Program)
class ProgramAspect {
	@Step
	@InitializeModel
	def void initializeModel(EList<String> args) {
		val context = VmFactory.eINSTANCE.createInterpreterRuntimeContext

		// TODO: pass by bytes
		try {
			val File myObj = new File("/home/crelevat/eclipse-workspaces/runtime-GPFL/test-gpfl/dhcp_input-dataset.txt");
			val Scanner myReader = new Scanner(myObj);
			while (myReader.hasNextLine()) {
			  var String[] data = myReader.nextLine().split("[; (),]");
			  val ParamMap packet = VmFactory.eINSTANCE.createParamMap
			  val time = VmFactory.eINSTANCE.createParamMapEntry
			  time.key = "time"; time.value=data.get(1)
			  packet.entries.add(time)
			  val port = VmFactory.eINSTANCE.createParamMapEntry
			  port.key = "port"; port.value=data.get(2)
			  packet.entries.add(port)
			  for (var int i=3; i<data.length; i++) {
				val info = VmFactory.eINSTANCE.createParamMapEntry
				info.key = data.get(i).split("=").get(0); info.value=data.get(i).split('"').get(1)
				packet.entries.add(info)
			  }
			  context.packetMap.add(packet)
			}
			myReader.close();
	    } catch (FileNotFoundException e) {
	    	context.logger.debug("No input data" + System.getProperty("user.dir"), "Gpfl")
	      	e.printStackTrace();
	    }
	    
	    _self.runtimeContext = context
	}

	@Step
	@Main
	def void run() {
		val context = _self.runtimeContext as InterpreterRuntimeContext
		context.logger.debug("Start on " + _self.eResource.URI, "GPFL")

		// Run initialization sequence
		_self.prologues.forEach[p|p.run(context)]
		
		// for each packets
		for(packet : context.packetMap) {
			// set current packet and time
			context.currentPacket = packet
			context.time = Integer.valueOf(context.currentPacket.entries.findFirst[e | e.key.equals("time")].value as String)
			// for each statement
			_self.statements.forEach [ i |
				// execute interruption if there is one at this time
				context.interuptions.filter [ interupt |
					(interupt.loop && context.time % interupt.executionTime == 0) ||
						(!interupt.loop && interupt.executionTime == context.time)
				].forEach[ interupt |
					interupt.actions.forEach [ a |
						(a as Stmt).run(context)
					]
				]
				// execute statement
				if (!context.skip) i.run(_self.runtimeContext as InterpreterRuntimeContext)
			]
		}
	}
}

@Aspect(className=ProloguesElt)
class ProloguesEltAspect {
	def void run(InterpreterRuntimeContext context) {
		// ignore automataDefinition because an automata is created 
		// in memory only when newAutomaton is called
		_self.init.run(context)
	}
}

@Aspect(className=InitSeq)
class InitSeqAspect {
	def void run(InterpreterRuntimeContext context) {
		_self.statement.forEach[s|s.run(context)]
	}
}

@Aspect(className=AutomataDef)
class AutomataDefAspect {
	// create empty automata
	def void run(InterpreterRuntimeContext context) {
		val auto = VmFactory.eINSTANCE.createAutomata
		auto.name = _self.nameAutomata
		context.automatas.add(auto)
	}
}

@Aspect(className=AutomataDefTail)
class AutomataDefTailAspect {
	def void run(InterpreterRuntimeContext context, Automata automata) {
		// set name of initial state 
		automata.initialState.name = _self.AStateId.name
		// create each transition and other states
		_self.ATransition.forEach[t|t.run(context, automata)]
		// set initial state as current state
		automata.currentState = automata.states.findFirst[s | s.name.equals(_self.AStateId.name)]
	}
}

@Aspect(className=ATransition)
class ATransitionAspect {
	// create all nodes and transitions from automata 
	def void run(InterpreterRuntimeContext context, Automata automata) {
		// get source node or if it doesn't exits create it
		var source = automata.states.findFirst[s|s.name.equals(_self.from)]
		if (source === null) {
			source = VmFactory.eINSTANCE.createState
			source.name = _self.from.name
			automata.states.add(source)
		}
		// get target node or if it doesn't exits create it
		var target = automata.states.findFirst[s|s.name.equals(_self.to)]
		if (target === null) {
			target = VmFactory.eINSTANCE.createState
			target.name = _self.to.name
			automata.states.add(target)
		}
		
		// create transition between source state and target state for automata
		val trans = VmFactory.eINSTANCE.createTransition
		trans.source = source
		trans.target = target
		val guard = VmFactory.eINSTANCE.createGuard
		guard.pktType = _self.type
		trans.guard = guard
		automata.transitions.add(trans)
	}
}

@Aspect(className=Node)
class NodeAspect {
}

@Aspect(className=Fields)
class FieldsAspect {
}

@Aspect(className=Stmt)
class StmtAspect {
	def void run(InterpreterRuntimeContext context) {
		context.logger.error("Stmt: run of " + _self + " should never occur, please write method run for this class", "Gpfl")
	}
}

@Aspect(className=Condition)
class ConditionAspect extends StmtAspect {
	// if the condition is true, execute the statements
	def void run(InterpreterRuntimeContext context) {
		if (_self.checkCond == 1)
			_self.statementCond.forEach[s|if (!context.skip)s.run(context)]
	}
}

@Aspect(className=Iteration)
class IterationAspect extends StmtAspect {
	// while the condition is true, execute the statements
	def void run(InterpreterRuntimeContext context) {
		while (_self.checkIter == 1)
			_self.statementIter.forEach[s|if (!context.skip) s.run(context)]
	}
}

@Aspect(className=NewInterruption)
class NewInterruptionAspect extends StmtAspect {
	// create an interruption that will be executed on the next packet if time is good
	def void run(InterpreterRuntimeContext context) {
		var interupt = VmFactory.eINSTANCE.createInterruption
		interupt.loop = _self.loop.equals("true")
		interupt.executionTime = _self.time
	}
}

@Aspect(className=Cmd)
class CmdAspect extends StmtAspect {
	def void run(InterpreterRuntimeContext context) {
		context.logger.error("Cmd: run of " + _self + " should never occur, please write method run for this class", "Gpfl")
	}
}

@Aspect(className=Nop)
class NopAspect extends CmdAspect {
	def void run(InterpreterRuntimeContext context) {
		// it actually does nothing
	}
}

@Aspect(className=Accept)
class AcceptAspect extends CmdAspect {
	// let the packet pass the verification and skip to the next packet
	// TODO: handle this with bytes
	def void run(InterpreterRuntimeContext context) {
		context.logger.debug(
			"(" + context.currentPacket.entries.findFirst[e|e.key.equals("time")].value + "; " +
				context.currentPacket.entries.findFirst[e|e.key.equals("port")].value + "; " +
				(context.currentPacket.entries.filter[e|e.key.equals("ressourceId")].empty ? '' : 'ressourceId="' +
					context.currentPacket.entries.findFirst[e|e.key.equals("ressourceId")].value + '",') + 'pkType="' +
				context.currentPacket.entries.findFirst[e|e.key.equals("pkType")].value + '",' + 'clientId="' +
				context.currentPacket.entries.findFirst[e|e.key.equals("clientId")].value + '")'
			,"Gpfl"
		)
		context.skip = true
	}
}

@Aspect(className=Drop)
class DropAspect extends CmdAspect {
	// Delete the packet and skip to the next packet
	def void run(InterpreterRuntimeContext context) {
		context.skip = true
	}
}

@Aspect(className=Send)
class SendAspect extends CmdAspect {
	def void run(InterpreterRuntimeContext context) {
		// TODO: think to what to do with that (keep it or not)
	}
}

@Aspect(className=Alarm)
class AlarmAspect extends CmdAspect {
	// Raise an error in the error log
	def void run(InterpreterRuntimeContext context) {
		context.logger.error(
			"ALARM @ " + context.currentPacket.entries.findFirst[e|e.key.equals("time")] + ": " + _self.message
			, "Gpfl"
		)
	}
}

@Aspect(className=Set)
class SetAspect extends CmdAspect {
	// create or set a new value for the variable
	def void run(InterpreterRuntimeContext context) {
		// if the variable doesn't already exists
		if (context.varMap.entries.filter[e|e.key.equals(_self.id)].empty) {
			// create a new entry in parameter map
			var entry = VmFactory.eINSTANCE.createParamMapEntry
			entry.key = _self.id
			entry.value = _self.newState
			context.varMap.entries.add(entry)
		} else {
			// change the value of the already existing object
			context.varMap.entries.findFirst[e|e.key.equals(_self.id)].value = _self.newState
		}
	}
}

@Aspect(className=NewAutomata)
class NewAutomataAspect extends CmdAspect {
	// create an automata from the previous definition
	def void run(InterpreterRuntimeContext context) {
		// get the previously created empty automata
		val automata = context.automatas.findFirst[a|
			a.name.equals((_self.eContainer as AutomataDef).nameAutomata)
		]
		// give it an id
		automata.id = _self.automatonId
		// get definition of the previously created automata
		val definitionAutomata = (_self.eAllContents.
			findFirst(o|o.eClass().getName().equals("AutomataDef")) as EList<AutomataDef>)
			.findFirst [a | a.nameAutomata.equals(automata.name)]
		// create empty initial state
		automata.initialState = VmFactory.eINSTANCE.createState
		// create automata based on detailed definition
		definitionAutomata.automataDefinitionDetail.run(context, automata)
	}
}

@Aspect(className=StepAutomata)
class StepAutomataAspect extends CmdAspect {
	// go through a step in the automata if possible
	def void run(InterpreterRuntimeContext context) {
		val guardName = _self.transition
		val automata = context.automatas.findFirst[ a | a.id.equals(_self.automatonId)]
		
		// get transitions that can be fired
		val currentTransitions = automata.transitions.filter[t | 
			t.source.name.equals(automata.currentState.name)
		].filter[t | 
			t.guard.pktType.equals(guardName)
		]
		// if there is no fireable transitions
		if (currentTransitions.empty)
			// execute all the statements
			_self.statment.forEach[s | s.run(context)]
		else
			// fire the transition
			automata.currentState = currentTransitions.get(0).target
	}
}

@Aspect(className=Expression)
class ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		context.logger.error("Expr: eval of " + _self + " should never occur, please write method run for this class", "Gpfl")
		return 0;
	}
}

@Aspect(className=Or)
class OrAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		if (_self.left.eval(context) == 1 || _self.right.eval(context) == 1)
			return 1
		return 0
	}
}

@Aspect(className=And)
class AndAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		if (_self.left.eval(context) == 1 && _self.right.eval(context) == 1)
			return 1
		return 0
	}
}

@Aspect(className=Equality)
class EqualityAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		if(_self.left.eval(context).equals(_self.right.eval(context))) return 1 else return 0
	}
}

@Aspect(className=Inequality)
class InequalityAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		if(!_self.left.eval(context).equals(_self.right.eval(context))) return 1 else return 0
	}
}

@Aspect(className=Greater)
class GreaterAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		if(_self.left.eval(context) > _self.right.eval(context)) return 1 else return 0
	}
}

@Aspect(className=Lower)
class LowerAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		if(_self.left.eval(context) < _self.right.eval(context)) return 1 else return 0
	}
}

@Aspect(className=GreaterOrEqual)
class GreaterOrEqualAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		if(_self.left.eval(context) >= _self.right.eval(context)) return 1 else return 0
	}
}

@Aspect(className=LowerOrEqual)
class LowerOrEqualAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		if(_self.left.eval(context) <= _self.right.eval(context)) return 1 else return 0
	}
}

@Aspect(className=Plus)
class PlusAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		return _self.left.eval(context) + _self.right.eval(context)
	}
}

@Aspect(className=Minus)
class MinusAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		return _self.left.eval(context) - _self.right.eval(context)
	}
}

@Aspect(className=Mult)
class MultAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		return _self.left.eval(context) * _self.right.eval(context)
	}
}

@Aspect(className=Div)
class DivAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		return _self.left.eval(context) / _self.right.eval(context)
	}
}

@Aspect(className=Not)
class NotAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		if(_self.expression.eval(context) == 1) return 0
		return 1
	}
}

@Aspect(className=IntConstant)
class IntConstantAspect extends ExpressionAspect {
	def Integer eval(InterpreterRuntimeContext context) {
		return _self.value
	}
}

@Aspect(className=StringConstant)
class StringConstantAspect extends ExpressionAspect {
	def String eval(InterpreterRuntimeContext context) {
		return _self.value
	}
}

@Aspect(className=BoolConstant)
class BoolConstantAspect extends ExpressionAspect {
	def Boolean eval(InterpreterRuntimeContext context) {
		return _self.value.equals("true")
	}
}

@Aspect(className=PortConstant)
class PortConstantAspect extends ExpressionAspect {
	def String eval(InterpreterRuntimeContext context) {
		return _self.value
	}
}

@Aspect(className=BuiltInIdConstant)
class BuiltInIdConstantAspect extends ExpressionAspect {
	def String eval(InterpreterRuntimeContext context) {
		return context.currentPacket.entries.findFirst[e | e.key.equals("port")].value as String
	}
}

@Aspect(className=FieldIdConstant)
class FieldIdConstantAspect extends ExpressionAspect {
	def Object eval(InterpreterRuntimeContext context) {
		return context.currentPacket.entries.findFirst[e | e.key.equals(_self.value)].value
	}
}

@Aspect(className=AutomatonIdConstant)
class AutomatonIdConstantAspect extends ExpressionAspect {
	def Automata eval(InterpreterRuntimeContext context) {
		return context.automatas.findFirst[a | a.id.equals(_self.value)]
	}
}

@Aspect(className=AVarId)
class AVarIdAspect extends ExpressionAspect {
	def Object eval(InterpreterRuntimeContext context) {
		return context.varMap.entries.findFirst[e | e.key.equals(_self.value)].value
	}
}
