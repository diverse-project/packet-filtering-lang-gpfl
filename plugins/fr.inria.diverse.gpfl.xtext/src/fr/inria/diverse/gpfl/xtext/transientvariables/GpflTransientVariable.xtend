package fr.inria.diverse.gpfl.xtext.transientvariables

import fr.inria.diverse.gpfl.model.gpfl.Automata
import fr.inria.diverse.gpfl.model.gpfl.Policy
import fr.inria.diverse.gpfl.model.gpfl.Prologue
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EStructuralFeature
import org.eclipse.xtext.parsetree.reconstr.impl.DefaultTransientValueService

class GpflTransientVariable extends DefaultTransientValueService {
	override isCheckElementsIndividually(EObject owner, EStructuralFeature feature) {
		return false
	}
	
	override isTransient(EObject owner, EStructuralFeature feature, int index) {
		if (owner instanceof Policy && feature.name.equals("inPorts")) return true
		if (owner instanceof Policy && feature.name.equals("packets")) return true
		if (owner instanceof Policy && feature.name.equals("variables")) return true
		if (owner instanceof Automata && feature.name.equals("states")) return true
		if (owner instanceof Automata && feature.name.equals("events")) return true
		if (owner instanceof Prologue && feature.name.equals("eventPool")) return true
		return false
	}
}