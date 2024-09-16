package fr.inria.diverse.gpfl.k3dsa.Gpfl.modules

import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystem
import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystemManager

class MessagingModule {
	var static MessagingSystem internalLogger  
	def private static MessagingSystem logger(){
		if (internalLogger === null) { 
			val MessagingSystemManager msManager = new MessagingSystemManager
			internalLogger = msManager.createBestPlatformMessagingSystem("Gpfl","Simple Gpfl interpreter")
			
		} 
		return internalLogger
	}
	
	def static error(String message) {
		MessagingModule.logger.error(message, "Gpfl");
	}
	
	def static debug(String message) {
		MessagingModule.logger.debug(message, "Gpfl");
	}
}