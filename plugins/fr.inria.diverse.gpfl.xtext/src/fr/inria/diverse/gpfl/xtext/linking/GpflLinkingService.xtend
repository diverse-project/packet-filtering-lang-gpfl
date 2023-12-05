package fr.inria.diverse.gpfl.xtext.linking;

import fr.inria.diverse.gpfl.Automata
import fr.inria.diverse.gpfl.Field
import fr.inria.diverse.gpfl.FieldRef
import fr.inria.diverse.gpfl.GpflFactory
import fr.inria.diverse.gpfl.GpflPackage
import fr.inria.diverse.gpfl.PortRef
import fr.inria.diverse.gpfl.Program
import fr.inria.diverse.gpfl.SetVariable
import fr.inria.diverse.gpfl.Transition
import java.util.Collections
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.EcoreUtil2
import org.eclipse.xtext.linking.impl.DefaultLinkingService
import org.eclipse.xtext.linking.impl.IllegalNodeException
import org.eclipse.xtext.nodemodel.INode
import fr.inria.diverse.gpfl.StepAutomata

class GpflLinkingService extends DefaultLinkingService {
	def getStringValue(String string) {
		return string.substring(string.indexOf('"')+1, string.lastIndexOf('"'))
	}
	
	override getLinkedObjects(EObject context, EReference ref, INode node) throws IllegalNodeException {
		var referencesResolved = super.getLinkedObjects(context, ref, node);
		val root = EcoreUtil2.getRootContainer(context) as Program;
		
		// if the node does not has any linked object
		if (referencesResolved.isEmpty()) {
			
			if (context instanceof Transition) {
				var transition = context as Transition;
				val automata = transition.eContainer() as Automata;
				//------------------- EVENT CREATION -------------------//
				if (ref == GpflPackage.Literals.TRANSITION__EVENT) {
					var event = GpflFactory.eINSTANCE.createEvent
					event.name = node.text.getStringValue
					automata.events.add(event)
					transition.event = event
					referencesResolved = Collections.singletonList(event)
				} else {
					//------------------- STATE CREATION -------------------//
					var state = automata.states.findFirst[s | s.name.equals(node.text)]
					if (state ===  null) {
						state = GpflFactory.eINSTANCE.createState
						state.name = node.text.getStringValue
						automata.states.add(state);
					}
					if (ref == GpflPackage.Literals.TRANSITION__FROM)transition.from = state
					else if (ref == GpflPackage.Literals.TRANSITION__TO)transition.to = state
					referencesResolved = Collections.singletonList(state)
				}
			} else if (context instanceof Automata && ref == GpflPackage.Literals.AUTOMATA__INITIAL_STATE) {
				//------------------- INITIAL STATE CREATION -------------------//
				val automata = context as Automata;
				val state = GpflFactory.eINSTANCE.createState()
				state.setName(node.text.getStringValue)
				automata.states.add(state)
				automata.initialState = state
				referencesResolved = Collections.singletonList(state)
			}
			
			//------------------- VARIABLE DECLARATION CREATION AND REFERENCE -------------------//
		
			if (context instanceof SetVariable && ref == GpflPackage.Literals.SET_VARIABLE__DECLARATION) {
				var set = context as SetVariable
				if (node.text.startsWith("$")) { // if we set a field
					var field = root.packets.get(0).fields.findFirst[p | p.name.equals(node.text)]
					if (field === null) {
						field = GpflFactory.eINSTANCE.createField()
						field.name = node.text
						field.value = ""
						root.packets.get(0).fields.add(field)
					}
					referencesResolved = Collections.singletonList(field)
				} else {// if we set a variable
					var vardec = root.variables.findFirst[v | v.name.equals(node.text)]
					if (vardec === null) {
						vardec = GpflFactory.eINSTANCE.createVariableDeclaration()
						vardec.name = node.text
						root.variables.add(vardec)
						set.declaration = vardec
					}
					referencesResolved = Collections.singletonList(vardec)
				}
			}
			
			//------------------- PORT REFERENCE -------------------//
			
			if (context instanceof PortRef) {
				var portRef = context as PortRef
				var port = root.ports.findFirst[p | p.name.equals(node.text)]
				if (port !== null) {
					portRef.port = port
					referencesResolved = Collections.singletonList(port)
				}
			}
			
			//------------------- EVENT REFERENCE -------------------//
			
			if (ref == GpflPackage.Literals.STEP_AUTOMATA__EVENT_NAME ) {
				val step = context as StepAutomata
				if (node.text.contains('"')) { // if it's a string literal
					referencesResolved = Collections.singletonList(step.idAutomata.value.events.findFirst[e | e.name.equals(node.text.getStringValue)])
				} else {
//					var NewEventRef newER
//					newER = EcoreUtil2.getAllContentsOfType(root, newER.class).findFirst[n | n.name.equals()]
				}
			}
			if (ref == GpflPackage.Literals.NEW_EVENT_REF__VALUE) {
//				referencesResolved = Collections.singletonList(step.idAutomata.value.events.findFirst[e | e.name.equals(node.text.getStringValue)])
			}
			
			//------------------- FIELD REFERENCE -------------------//
			if (context instanceof FieldRef) {
				val Field field = GpflFactory.eINSTANCE.createField;
				field.name = node.text
				field.value = ""
				root.packets.get(0).fields.add(field)
				Collections.singletonList(field)
			}
		}

//		EcoreUtil2.getAllContentsOfType(root, Set.class)
		
		return referencesResolved;
	}
}