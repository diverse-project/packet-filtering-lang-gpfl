package fr.inria.sed.gpfl.xtext.linking;

import java.util.Collections;
import java.util.List;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EReference;
import org.eclipse.xtext.linking.impl.DefaultLinkingService;
import org.eclipse.xtext.linking.impl.IllegalNodeException;
import org.eclipse.xtext.nodemodel.INode;

import fr.inria.sed.gpfl.Automata;
import fr.inria.sed.gpfl.GpflFactory;
import fr.inria.sed.gpfl.State;
import fr.inria.sed.gpfl.Transition;

public class GpflLinkingService extends DefaultLinkingService {
	@Override
	public List<EObject> getLinkedObjects(EObject context, EReference ref, INode node) throws IllegalNodeException {
		List<EObject> referencesResolved = super.getLinkedObjects(context, ref, node);
		boolean shouldCreateAState = referencesResolved.isEmpty() && context instanceof Transition;
		if (shouldCreateAState) {
			//
			// Get the context
			//
			Transition transition = (Transition) context;
			Automata automata = (Automata) transition.eContainer();
			//
			// Add a new State to our FSM
			//
			State newState = GpflFactory.eINSTANCE.createState();
			newState.setName(node.getText());
			automata.getStates().add(newState);
			//
			// Update the list of resolved references
			//
			referencesResolved = Collections.singletonList(newState);
		}
		return referencesResolved;
	}
}
