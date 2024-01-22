package fr.inria.diverse.gpfl.k3dsa.gpfl.modules

import fr.inria.diverse.gpfl.Port

class GpflPortsModule {
	def static oppositePort(Port[] inPorts, Port inputPort) {
		return inPorts.findFirst[p | p.name !== inputPort.name]
	}
}