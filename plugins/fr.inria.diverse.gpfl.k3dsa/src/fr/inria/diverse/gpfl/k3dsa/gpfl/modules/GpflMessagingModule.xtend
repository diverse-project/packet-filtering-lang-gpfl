package fr.inria.diverse.gpfl.k3dsa.gpfl.modules

import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystem
import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystemManager

class GpflMessagingModule {
	var static MessagingSystem internalLogger  
	def static MessagingSystem logger(){
		if (internalLogger === null) { 
			val MessagingSystemManager msManager = new MessagingSystemManager
			internalLogger = msManager.createBestPlatformMessagingSystem("Gpfl","Simple Gpfl interpreter")
			
		} 
		return internalLogger
	}
}