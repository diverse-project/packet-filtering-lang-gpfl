package fr.inria.diverse.gpfl.k3dsa.Gpfl.src

import com.fasterxml.jackson.annotation.JsonCreator
import com.fasterxml.jackson.annotation.JsonProperty

class RawPacket {
	int time
	int port
	String content
	
	@JsonCreator(mode = JsonCreator.Mode.PROPERTIES)
	new (@JsonProperty("time") int time, 
		@JsonProperty("port") int port, 
		@JsonProperty("content") String content
	) {
		this.time = time
		this.port = port
		this.content = content
	}
	
	def int getTime() {
		return this.time
	}
	
	def int getPort() {
		return this.port
	}
	
	def String getContent() {
		return this.content
	}
}