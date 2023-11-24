package fr.inria.sed.gpfl.xtext.linking;

import fr.inria.sed.gpfl.Automata
import fr.inria.sed.gpfl.GpflFactory
import fr.inria.sed.gpfl.PortRef
import fr.inria.sed.gpfl.Program
import fr.inria.sed.gpfl.Set
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

class GpflLinkingService extends DefaultLinkingService {
	
	override getLinkedObjects(EObject context, EReference ref, INode node) throws IllegalNodeException {
		println("link ! "+context)
		var referencesResolved = super.getLinkedObjects(context, ref, node);
		val root = EcoreUtil2.getRootContainer(context) as Program;
		
		// if the node does not has any linked object
		if (referencesResolved.isEmpty()) {
			
			//------------------- STATE CREATION -------------------//
			
			var Automata automata = null;
			// get the automata (the parent) of the node
			if (context instanceof Transition) {
				var transition = context as Transition;
				automata = transition.eContainer() as Automata;
			} else if (context instanceof Automata && ref == GpflPackage.Literals.AUTOMATA__INITIAL_STATE)
				automata = context as Automata;
			// create the node
			if (automata !== null) {
				var newState = GpflFactory.eINSTANCE.createState();
				newState.setName(node.getText());
				automata.getStates().add(newState);
				referencesResolved = Collections.singletonList(newState);
			}
		
			//------------------- VARIABLE DECLARATION CREATION -------------------//
		
			if (context instanceof Set && ref == GpflPackage.Literals.SET__DECLARATION) {
				var vardec = root.variables.findFirst[v | v.name.equals(node.text)]
				if (vardec === null) {
					vardec = GpflFactory.eINSTANCE.createVariableDeclaration()
					vardec.setName(node.getText())
					root.getVariables().add(vardec)
				}
				referencesResolved = Collections.singletonList(vardec)
			}
			
			//------------------- PORT CREATION -------------------//
			
			if (context instanceof PortRef) {
				var port = root.ports.findFirst[p | p.name.equals(node.text)]
				if (port === null) {
					port = GpflFactory.eINSTANCE.createPort()
					port.setName(node.text)
					root.getPorts().add(port)
				}
				referencesResolved = Collections.singletonList(port)
			}
			
			//------------------- TRANSITION REFERENCE -------------------//
			
			if (context instanceof StepAutomata && ref == GpflPackage.Literals.STEP_AUTOMATA__TRANSITION_NAME) {
				var step = context as StepAutomata
				var trans = step.idAutomata.value.transitions.findFirst[t | t.name.equals(node.text.replaceAll('"', ''))]
				if (trans !== null) referencesResolved = Collections.singletonList(trans)
			}
		} //else {
//			//------------------- VARIABLE DECLARATION REFERENCE -------------------//
//			if (context instanceof Set && ref.name.equals("declaration")) {
//				var initialSet = root.variables.findFirst[ v | v.name.equals(node.text)]
//				if (initialSet !== null) referencesResolved = Collections.singletonList(initialSet)
//			}
//		}

//		EcoreUtil2.getAllContentsOfType(root, Set.class)
		
		return referencesResolved;
	}
}
