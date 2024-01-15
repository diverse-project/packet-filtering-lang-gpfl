package fr.inria.diverse.gpfl.xtext.ast

import fr.inria.diverse.gpfl.GpflFactory
import fr.inria.diverse.gpfl.Program
import java.util.Collections
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.nodemodel.INode
import org.eclipse.xtext.parser.DefaultEcoreElementFactory

class GpflAstFactory extends DefaultEcoreElementFactory {
	override set(EObject object, String feature, Object value, String ruleName, INode node) {
		super.set(object, feature, value, ruleName, node)
		
		if (object instanceof Program) {
			val root = object as Program
			
			//------------------- PORT CREATION -------------------//
		
			if (root.inPorts.length !==  2) {
				root.inPorts.clear()
				var portIn = GpflFactory.eINSTANCE.createPort()
				portIn.setName("inSide")
				var portOut = GpflFactory.eINSTANCE.createPort()
				portOut.setName("outSide")
				Collections.addAll(root.inPorts, portIn, portOut)
			}
			
			//------------------- EMPTY PACKET CREATION -------------------//
			if (root.packets.isEmpty) {
				var emptyPacket = GpflFactory.eINSTANCE.createPacket
				emptyPacket.time = -1
				emptyPacket.inPort = root.inPorts.get(0)
				root.packets.add(emptyPacket)
			}
		}
	}
}