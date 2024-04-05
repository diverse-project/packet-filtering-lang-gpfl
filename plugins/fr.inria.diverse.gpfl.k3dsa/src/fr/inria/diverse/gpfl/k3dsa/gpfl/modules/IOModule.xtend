package fr.inria.diverse.gpfl.k3dsa.gpfl.modules

import fr.inria.diverse.gpfl.model.gpfl.GpflFactory
import fr.inria.diverse.gpfl.model.gpfl.Packet
import fr.inria.diverse.gpfl.model.gpfl.Policy
import fr.inria.diverse.gpfl.model.gpfl.Port
import java.io.File
import java.io.FileOutputStream
import java.util.Scanner

class IOModule {
	def static createPacketsFromFile(Policy root, File inputData) {
		val input = new Scanner(inputData)
		
		while (input.hasNextLine) {
			val line = input.nextLine
			var packet = GpflFactory.eINSTANCE.createPacket
			val String[] packet_data = line.substring(1, line.length-1).split(";")
			packet.time = Integer.valueOf(packet_data.get(0))
			var interface = root.interfaces.findFirst[i | i.name.equals(packet_data.get(1))]
			if (interface === null) {
				interface = GpflFactory.eINSTANCE.createInterface
				interface.name = packet_data.get(1)
				root.interfaces.add(interface)
			}
			var port = root.inPorts.findFirst[p | p.number.equals(Integer.parseInt(packet_data.get(2)))]
			if (port === null) {
				port = GpflFactory.eINSTANCE.createPort
				port.number = Integer.parseInt(packet_data.get(2))
				root.inPorts.add(port)
			}
			port.interface = interface
			interface.ports.add(port)
			packet.inPort = port
			packet.content = packet_data.get(3)
			root.packets.add(packet)
		}
		input.close
	}
	
	static var FileOutputStream output = null
	
	def static createOutputFile(File outputData) {
		output = new FileOutputStream(outputData)
		output.write(''.getBytes)
	}
	
	def static writePacket(Packet packet, Port port) {
		var outPacket = "("+packet.time+";"+ port.number+";"+packet.content+")\n"
		output.write(outPacket.getBytes)
	}
}