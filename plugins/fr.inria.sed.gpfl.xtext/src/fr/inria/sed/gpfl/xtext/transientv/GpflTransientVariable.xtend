package fr.inria.sed.gpfl.xtext.transientv

import fr.inria.sed.gpfl.Automata
import fr.inria.sed.gpfl.Program
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EStructuralFeature
import org.eclipse.xtext.parsetree.reconstr.impl.DefaultTransientValueService

class GpflTransientVariable extends DefaultTransientValueService {
	override isCheckElementsIndividually(EObject owner, EStructuralFeature feature) {
		return false
	}
	
	override isTransient(EObject owner, EStructuralFeature feature, int index) {
		if (owner instanceof Program && feature.name.equals("ports")) return true
		if (owner instanceof Program && feature.name.equals("packets")) return true
		if (owner instanceof Program && feature.name.equals("variables")) return true
		if (owner instanceof Automata && feature.name.equals("states")) return true
		return false
	}
}