package fr.inria.diverse.gpfl.k3dsa.gpfl.modules

import fr.inria.diverse.gpfl.Program

class GpflPortsModule {
	def static oppositePort(Program root) {
		return root.inPorts.findFirst[p | p.name !== root.currentPacket.inPort.name]
	}
}