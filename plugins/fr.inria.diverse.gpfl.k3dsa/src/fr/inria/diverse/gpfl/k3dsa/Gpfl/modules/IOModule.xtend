package fr.inria.diverse.gpfl.k3dsa.Gpfl.modules

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory
import fr.inria.diverse.gpfl.model.gpfl.GpflFactory
import fr.inria.diverse.gpfl.model.gpfl.Packet
import fr.inria.diverse.gpfl.model.gpfl.Policy
import fr.inria.diverse.gpfl.model.gpfl.Port
import java.io.File
import java.io.FileOutputStream
import java.util.Scanner
import fr.inria.diverse.gpfl.k3dsa.Gpfl.src.RawPacket

class IOModule {
	def static createPacketsFromFile(Policy root, File inputData) {
		val input = new Scanner(inputData)
		var mapper = new ObjectMapper(new YAMLFactory())
		
		while (input.hasNextLine) {
			var line = input.nextLine
			for (var i=0; i<3; i++) {
				line += "\n" + input.nextLine
			}
			var packet = GpflFactory.eINSTANCE.createPacket
			val rawPacket = mapper.readValue(line, typeof(RawPacket))
			packet.time = rawPacket.time
			// port
			var port = root.inPorts.findFirst[p | p.number.equals(rawPacket.port)]
			if (port === null) {
				MessagingModule.error("Unknown entry port for packet " + packet.time + ".\nPlease change port number or add it port configuration.")
				throw new Exception("Unkown port")
			}
			packet.inPort = port
			packet.content = rawPacket.content
			root.packets.add(packet)
		}
		input.close
	}
	
	
	def static writePacket(Packet packet, Port port, FileOutputStream outputFile) {
		var mapper = new ObjectMapper(new YAMLFactory())
		outputFile.write(mapper.writeValueAsString(new RawPacket(packet.time, port.number, packet.content)).getBytes)
	}
}