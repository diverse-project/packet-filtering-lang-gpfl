package fr.inria.diverse.gpfl.k3dsa.gpfl.modules

import java.io.File
import java.util.Scanner
import fr.inria.diverse.gpfl.GpflFactory
import fr.inria.diverse.gpfl.Program
import java.io.FileOutputStream
import fr.inria.diverse.gpfl.Packet
import fr.inria.diverse.gpfl.Port

class IOModule {
	def static createPacketsFromFile(Program root, String path) {
		try {
			val input = new Scanner(new File(path))
			
			while (input.hasNextLine) {
				val line = input.nextLine
				var packet = GpflFactory.eINSTANCE.createPacket
				val String[] packet_data = line.substring(1, line.length-1).split(";")
				packet.time = Integer.valueOf(packet_data.get(0))
				packet.inPort = root.inPorts.findFirst[p | p.name.equals(packet_data.get(1))]
				packet.content = packet_data.get(2)
				root.packets.add(packet)
			}
			input.close
		} catch(NullPointerException e) {
			GpflMessagingModule.logger.error("Input file " + path + " not found\nGo check run configurations", "Gpfl")
			e.printStackTrace
		}
	}
	
	static var FileOutputStream output = null
	
	def static createOutputFile(String path) {
		try {
			output = new FileOutputStream((new File(path)))
			output.write(''.getBytes)
		} catch(NullPointerException e) {
			GpflMessagingModule.logger.error("Output file " + path + " not found\nGo check run configurations", "Gpfl")
			e.printStackTrace
		}
	}
	
	def static writePacket(Port[] inPorts, Packet packet) {
		var outPacket = "("+packet.time+";"+ GpflPortsModule.oppositePort(inPorts, packet.inPort).name+";"+packet.content+")\n"
		output.write(outPacket.getBytes)
	}
}