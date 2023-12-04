package fr.inria.sed.gpfl.xtext.ast

import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.nodemodel.INode
import org.eclipse.xtext.parser.DefaultEcoreElementFactory
import fr.inria.sed.gpfl.Program
import fr.inria.sed.gpfl.GpflFactory
import java.util.Collections
import fr.inria.sed.gpfl.Send

class GpflAstFactory extends DefaultEcoreElementFactory {
	override set(EObject object, String feature, Object value, String ruleName, INode node) {
		super.set(object, feature, value, ruleName, node)
		
		if (object instanceof Program) {
			var root = object as Program
			
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
		}
	}
}