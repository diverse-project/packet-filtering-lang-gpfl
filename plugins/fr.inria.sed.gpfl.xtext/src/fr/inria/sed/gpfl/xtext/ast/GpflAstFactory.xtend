package fr.inria.sed.gpfl.xtext.ast

import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.conversion.ValueConverterException
import org.eclipse.xtext.nodemodel.INode
import org.eclipse.xtext.parser.DefaultEcoreElementFactory

class GpflAstFactory extends DefaultEcoreElementFactory {
	override set(EObject object, String feature, Object value, String ruleName, INode node) throws ValueConverterException {
		super.set(object, feature, value, ruleName, node)
	}
}