package fr.inria.diverse.gpfl.k3dsa.gpfl.modules

import java.io.File
import java.util.Scanner
import fr.inria.diverse.gpfl.GpflFactory
import fr.inria.diverse.gpfl.Program
import java.io.FileOutputStream

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
				for (field_data : packet_data.get(2).split(",")) {
					val field = GpflFactory.eINSTANCE.createField
					field.name = "$"+field_data.substring(0, field_data.indexOf("="))
					field.value = field_data.split('"').get(1)
					packet.fields.add(field)
				}
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
			GpflMessagingModule.logger.error("Input file " + path + " not found\nGo check run configurations", "Gpfl")
			e.printStackTrace
		}
	}
	
	def static writePacket(Program root) {
		var packet = "("+root.currentTime+";"+ GpflPortsModule.oppositePort(root).name+"; "
		packet+=root.currentPacket.fields.get(0).name.substring(1)+'="'+root.currentPacket.fields.get(0).value+'"'
		for (var i=1; i<root.currentPacket.fields.length; i++) {
			packet+=","+root.currentPacket.fields.get(i).name.substring(1)+'="'+root.currentPacket.fields.get(i).value+'"'
		}
		packet+=")\n"
		output.write(packet.getBytes)
	}
}