package fr.inria.diverse.gpfl.xtext.transientvariables

import fr.inria.diverse.gpfl.Automata
import fr.inria.diverse.gpfl.Program
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EStructuralFeature
import org.eclipse.xtext.parsetree.reconstr.impl.DefaultTransientValueService
import fr.inria.diverse.gpfl.Prologue

class GpflTransientVariable extends DefaultTransientValueService {
	override isCheckElementsIndividually(EObject owner, EStructuralFeature feature) {
		return false
	}
	
	override isTransient(EObject owner, EStructuralFeature feature, int index) {
		if (owner instanceof Program && feature.name.equals("inPorts")) return true
		if (owner instanceof Program && feature.name.equals("packets")) return true
		if (owner instanceof Program && feature.name.equals("variables")) return true
		if (owner instanceof Automata && feature.name.equals("states")) return true
		if (owner instanceof Automata && feature.name.equals("events")) return true
		if (owner instanceof Prologue && feature.name.equals("eventPool")) return true
		return false
	}
}