package fr.inria.diverse.gpfl.k3dsa.Gpfl.src

import com.fasterxml.jackson.annotation.JsonCreator
import com.fasterxml.jackson.annotation.JsonProperty

class ConfigPort {
	int number
	int out
	String side
	
	@JsonCreator(mode = JsonCreator.Mode.PROPERTIES)
	new (@JsonProperty("number") int number, 
		@JsonProperty("out") int out, 
		@JsonProperty("side") String side
	) {
		this.number = number
		this.out = out
		this.side = side
	}
	
	def int getNumber() {
		return this.number
	}
	
	def int getOut() {
		return this.out
	}
	
	def String getSide() {
		return this.side
	}
}