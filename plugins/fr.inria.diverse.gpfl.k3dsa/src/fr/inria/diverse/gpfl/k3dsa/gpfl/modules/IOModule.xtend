package fr.inria.diverse.gpfl.k3dsa.gpfl.modules

import fr.inria.diverse.gpfl.GpflFactory
import fr.inria.diverse.gpfl.Packet
import fr.inria.diverse.gpfl.Port
import fr.inria.diverse.gpfl.Policy
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
			var port = root.inPorts.findFirst[p | p.name.equals(packet_data.get(1))]
			if (port === null) {
				port = GpflFactory.eINSTANCE.createPort
				port.name = packet_data.get(1)
				root.inPorts.add(port)
			}
			packet.inPort = port
			packet.content = packet_data.get(2)
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
		var outPacket = "("+packet.time+";"+ port.name+";"+packet.content+")\n"
		output.write(outPacket.getBytes)
	}
}