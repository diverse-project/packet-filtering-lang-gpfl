package fr.inria.diverse.gpfl.k3dsa.gpfl.aspects

import fr.inria.diverse.k3.al.annotationprocessor.Aspect
import fr.inria.diverse.gpfl.Program
import fr.inria.diverse.gpfl.Prologue
import fr.inria.diverse.gpfl.InitSeq
import fr.inria.diverse.gpfl.Automata
import fr.inria.diverse.gpfl.Stmt
import fr.inria.diverse.gpfl.Cmd
import fr.inria.diverse.gpfl.RuntimeContext
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
import fr.inria.diverse.gpfl.NewEventRef

import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.ProgramAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.PrologueAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.InitSeqAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.AutomataAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.StmtAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.CmdAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.RuntimeContextAspect.*
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
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.PacketAspect.*
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
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.VariableDeclarationAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.VariableRefAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.BooleanDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.IntegerDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.StringDecAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.PortAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.FieldAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.FieldRefAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.EventAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.SetTypeAspect.*
import static extension fr.inria.diverse.gpfl.k3dsa.gpfl.aspects.NewEventRefAspect.*
import java.util.List
import fr.inria.diverse.k3.al.annotationprocessor.Main

@Aspect(className=Program)
class ProgramAspect {

@Main
 def void main(List<String> args){
 	
 }
}

@Aspect(className=Prologue)
class PrologueAspect {

}

@Aspect(className=InitSeq)
class InitSeqAspect {

}

@Aspect(className=Automata)
class AutomataAspect {

}

@Aspect(className=Stmt)
abstract class StmtAspect {

}

@Aspect(className=Cmd)
abstract class CmdAspect extends StmtAspect {

}

@Aspect(className=RuntimeContext)
abstract class RuntimeContextAspect {

}

@Aspect(className=NewAutomata)
class NewAutomataAspect extends CmdAspect {

}

@Aspect(className=Alarm)
class AlarmAspect extends CmdAspect {

}

@Aspect(className=Send)
class SendAspect extends CmdAspect {

}

@Aspect(className=SetVariable)
class SetVariableAspect extends CmdAspect {

}

@Aspect(className=StepAutomata)
class StepAutomataAspect extends StmtAspect {

}

@Aspect(className=Nop)
class NopAspect extends CmdAspect {

}

@Aspect(className=Accept)
class AcceptAspect extends CmdAspect {

}

@Aspect(className=Drop)
class DropAspect extends CmdAspect {

}

@Aspect(className=Condition)
class ConditionAspect extends StmtAspect {

}

@Aspect(className=Iteration)
class IterationAspect extends StmtAspect {

}

@Aspect(className=NewInterruption)
class NewInterruptionAspect extends StmtAspect {

}

@Aspect(className=Filter)
class FilterAspect {

}

@Aspect(className=State)
class StateAspect {

}

@Aspect(className=Transition)
class TransitionAspect {

}

@Aspect(className=Block)
class BlockAspect {

}

@Aspect(className=Packet)
class PacketAspect {

}

@Aspect(className=Expression)
abstract class ExpressionAspect {

}

@Aspect(className=UnaryOp)
abstract class UnaryOpAspect extends ExpressionAspect {

}

@Aspect(className=BinaryOp)
abstract class BinaryOpAspect extends ExpressionAspect {

}

@Aspect(className=PortRef)
class PortRefAspect extends ExpressionAspect {

}

@Aspect(className=StringLiteral)
class StringLiteralAspect extends ExpressionAspect {

}

@Aspect(className=IntLiteral)
class IntLiteralAspect extends ExpressionAspect {

}

@Aspect(className=BooleanLiteral)
class BooleanLiteralAspect extends ExpressionAspect {

}

@Aspect(className=Not)
class NotAspect extends UnaryOpAspect {

}

@Aspect(className=Or)
class OrAspect extends BinaryOpAspect {

}

@Aspect(className=And)
class AndAspect extends BinaryOpAspect {

}

@Aspect(className=Equality)
class EqualityAspect extends BinaryOpAspect {

}

@Aspect(className=Inequality)
class InequalityAspect extends BinaryOpAspect {

}

@Aspect(className=GreaterOrEqual)
class GreaterOrEqualAspect extends BinaryOpAspect {

}

@Aspect(className=LowerOrEqual)
class LowerOrEqualAspect extends BinaryOpAspect {

}

@Aspect(className=Greater)
class GreaterAspect extends BinaryOpAspect {

}

@Aspect(className=Lower)
class LowerAspect extends BinaryOpAspect {

}

@Aspect(className=Plus)
class PlusAspect extends BinaryOpAspect {

}

@Aspect(className=Minus)
class MinusAspect extends BinaryOpAspect {

}

@Aspect(className=Mult)
class MultAspect extends BinaryOpAspect {

}

@Aspect(className=Div)
class DivAspect extends BinaryOpAspect {

}

@Aspect(className=Neg)
class NegAspect extends UnaryOpAspect {

}

@Aspect(className=VariableDeclaration)
class VariableDeclarationAspect extends SetTypeAspect {

}

@Aspect(className=VariableRef)
class VariableRefAspect extends ExpressionAspect {

}

@Aspect(className=BooleanDec)
class BooleanDecAspect extends VariableDeclarationAspect {

}

@Aspect(className=IntegerDec)
class IntegerDecAspect extends VariableDeclarationAspect {

}

@Aspect(className=StringDec)
class StringDecAspect extends VariableDeclarationAspect {

}

@Aspect(className=Port)
class PortAspect {

}

@Aspect(className=Field)
class FieldAspect extends SetTypeAspect {

}

@Aspect(className=FieldRef)
class FieldRefAspect extends ExpressionAspect {

}

@Aspect(className=Event)
class EventAspect {

}

@Aspect(className=SetType)
abstract class SetTypeAspect {

}

@Aspect(className=NewEventRef)
class NewEventRefAspect extends CmdAspect {

}



