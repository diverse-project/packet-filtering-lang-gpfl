package fr.inria.sed.gpfl.xtext.linking;

import fr.inria.sed.gpfl.Automata
import fr.inria.sed.gpfl.GpflFactory
import fr.inria.sed.gpfl.PortRef
import fr.inria.sed.gpfl.Program
import fr.inria.sed.gpfl.StepAutomata
import fr.inria.sed.gpfl.Transition
import java.util.Collections
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.EcoreUtil2
import org.eclipse.xtext.linking.impl.DefaultLinkingService
import org.eclipse.xtext.linking.impl.IllegalNodeException
import org.eclipse.xtext.nodemodel.INode
import fr.inria.sed.gpfl.GpflPackage
import fr.inria.sed.gpfl.FieldRef
import fr.inria.sed.gpfl.Field
import fr.inria.sed.gpfl.SetVariable

class GpflLinkingService extends DefaultLinkingService {
	
	override getLinkedObjects(EObject context, EReference ref, INode node) throws IllegalNodeException {
		var referencesResolved = super.getLinkedObjects(context, ref, node);
		val root = EcoreUtil2.getRootContainer(context) as Program;
		
		//------------------- PORT CREATION -------------------//
		
		if (root.ports.length !==  2) {
			root.ports.clear()
			var portIn = GpflFactory.eINSTANCE.createPort()
			portIn.setName("inSide")
			var portOut = GpflFactory.eINSTANCE.createPort()
			portOut.setName("outSide")
			Collections.addAll(root.ports, portIn, portOut)
		}
		
		//------------------- EMPTY PACKET CREATION -------------------//
		if (root.packets.isEmpty) {
			var emptyPacket = GpflFactory.eINSTANCE.createPacket
			emptyPacket.time = -1
			emptyPacket.inPort = root.ports.get(0)
			root.packets.add(emptyPacket)
		}
		
		// if the node does not has any linked object
		if (referencesResolved.isEmpty()) {
			
			//------------------- STATE CREATION -------------------//
			
			if (context instanceof Transition) {
				var transition = context as Transition;
				val automata = transition.eContainer() as Automata;
				var state = automata.states.findFirst[s | s.name.equals(node.text)]
				if (state ===  null) {
					state = GpflFactory.eINSTANCE.createState();
					state.setName(node.text);
					automata.states.add(state);
				}
				if (ref == GpflPackage.Literals.TRANSITION__FROM)transition.from = state
				else if (ref == GpflPackage.Literals.TRANSITION__TO)transition.to = state
				referencesResolved = Collections.singletonList(state);
			} else if (context instanceof Automata && ref == GpflPackage.Literals.AUTOMATA__INITIAL_STATE) {
				val automata = context as Automata;
				var state = automata.states.findFirst[s | s.name.equals(node.text)]
				if (state ===  null) {
					state = GpflFactory.eINSTANCE.createState();
					state.setName(node.text);
					automata.states.add(state);
				}
				automata.initialState = state
				referencesResolved = Collections.singletonList(state);
			}
			
			//------------------- VARIABLE DECLARATION CREATION AND REFERENCE -------------------//
		
			if (context instanceof SetVariable && ref == GpflPackage.Literals.SET_VARIABLE__DECLARATION) {
				var set = context as SetVariable
				var vardec = GpflFactory.eINSTANCE.createVariableDeclaration()
				vardec.name = node.text
				root.variables.add(vardec)
				set.declaration = vardec
				referencesResolved = Collections.singletonList(vardec)
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
			
			//------------------- TRANSITION REFERENCE -------------------//
			
			if (context instanceof StepAutomata && ref == GpflPackage.Literals.STEP_AUTOMATA__TRANSITION_NAME) {
				val step = context as StepAutomata
				val trans = step.idAutomata.value.transitions.findFirst[t | t.name.equals(node.text.replaceAll('"', ''))]
				if (trans !== null) referencesResolved = Collections.singletonList(trans)
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
