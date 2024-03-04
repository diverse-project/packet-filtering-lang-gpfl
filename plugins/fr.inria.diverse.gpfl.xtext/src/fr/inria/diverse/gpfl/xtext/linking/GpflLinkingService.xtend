package fr.inria.diverse.gpfl.xtext.linking;

import fr.inria.diverse.gpfl.Automata
import fr.inria.diverse.gpfl.GpflFactory
import fr.inria.diverse.gpfl.GpflPackage
import fr.inria.diverse.gpfl.PortRef
import fr.inria.diverse.gpfl.Policy
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
import fr.inria.diverse.gpfl.EventOccurence
import fr.inria.diverse.gpfl.NewEventOccurence

class GpflLinkingService extends DefaultLinkingService {
	def getStringValue(String string) {
		return string.substring(string.indexOf('"')+1, string.lastIndexOf('"'))
	}
	
	override getLinkedObjects(EObject context, EReference ref, INode node) throws IllegalNodeException {
		var referencesResolved = super.getLinkedObjects(context, ref, node);
		val root = EcoreUtil2.getRootContainer(context) as Policy;
		
		// if the node does not has any linked object
		if (referencesResolved.isEmpty()) {
			if (context instanceof Transition) {
				var transition = context as Transition;
				val automata = transition.eContainer() as Automata;
				//------------------- EVENT CREATION -------------------//
				if (ref == GpflPackage.Literals.TRANSITION__EVENT) {
					var eventOcc = root.prologue.eventPool.findFirst[e | e.name === node.text.getStringValue]
					if (eventOcc === null) {
						var event = GpflFactory.eINSTANCE.createEvent
						event.name = node.text.getStringValue
						transition.event = event
						eventOcc = GpflFactory.eINSTANCE.createEventOccurence
						eventOcc.name = event.name
						eventOcc.event = event
						automata.events.add(event)
						root.prologue.eventPool.add(eventOcc)
					}
					referencesResolved = Collections.singletonList(eventOcc.event)
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
			} else if (ref == GpflPackage.Literals.AUTOMATA__INITIAL_STATE) {
				//------------------- INITIAL STATE CREATION -------------------//
				val automata = context as Automata;
				val state = GpflFactory.eINSTANCE.createState()
				state.setName(node.text.getStringValue)
				automata.states.add(state)
				automata.initialState = state
				referencesResolved = Collections.singletonList(state)
			}
			
			//------------------- VARIABLE DECLARATION CREATION AND REFERENCE -------------------//
		
			else if (ref == GpflPackage.Literals.SET_VARIABLE__DECLARATION) {
				var set = context as SetVariable
				var vardec = root.variables.findFirst[v | v.name.equals(node.text)]
				if (vardec === null) {
					vardec = GpflFactory.eINSTANCE.createVariableDeclaration
					vardec.name = node.text
					set.declaration = vardec
					root.variables.add(vardec)
				}
				referencesResolved = Collections.singletonList(vardec)
			}
			
			//------------------- PORT REFERENCE -------------------//
			
			else if (context instanceof PortRef) {
				var port = root.inPorts.findFirst[p | p.name.equals(node.text)]
				if (port === null) {
					port = GpflFactory.eINSTANCE.createPort
					port.name = node.text
					root.inPorts.add(port)
				}
			}
			
			//------------------- EVENT REFERENCE -------------------//
			else if (ref == GpflPackage.Literals.STEP_AUTOMATA__EVENT_OCCURENCE) {
				val step = context as StepAutomata
				val eventOcc = root.prologue.eventPool.findFirst[e | e.name.equals(node.text)]
				if (eventOcc !== null) {					
					step.eventOccurence = eventOcc
					referencesResolved = Collections.singletonList(eventOcc)
				}
			}
			
			else if (context instanceof NewEventOccurence) {
				val newEventOccurence = context as NewEventOccurence
				var eventOcc = null as EventOccurence
				if (ref == GpflPackage.Literals.NEW_EVENT_OCCURENCE__VALUE) {
					eventOcc = root.prologue.eventPool.findFirst[e | e.name.equals(node.text)]
					if (eventOcc !== null && eventOcc.event !== null) {						
						newEventOccurence.occurence.event = eventOcc.event
						referencesResolved = Collections.singletonList(eventOcc.event)
					}
				}
				else if (ref == GpflPackage.Literals.NEW_EVENT_OCCURENCE__OCCURENCE){		
					eventOcc = GpflFactory.eINSTANCE.createEventOccurence
					eventOcc.name = node.text
					root.prologue.eventPool.add(eventOcc)
				}
			}
		}
		
		return referencesResolved;
	}
}