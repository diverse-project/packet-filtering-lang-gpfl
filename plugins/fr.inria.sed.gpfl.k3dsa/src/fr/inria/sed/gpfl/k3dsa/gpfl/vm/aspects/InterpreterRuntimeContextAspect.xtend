package fr.inria.sed.gpfl.k3dsa.gpfl.vm.aspects;

import fr.inria.diverse.k3.al.annotationprocessor.Aspect;
import fr.inria.sed.gpfl.vm.model.vm.InterpreterRuntimeContext;
import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystemManager; 
import org.eclipse.gemoc.commons.eclipse.messagingsystem.api.MessagingSystem;

@Aspect(className=InterpreterRuntimeContext)
class InterpreterRuntimeContextAspect {
	var MessagingSystem internalLogger
	def MessagingSystem logger(){
		if (_self.internalLogger === null) {
			val MessagingSystemManager msManager = new MessagingSystemManager
			_self.internalLogger = msManager.createBestPlatformMessagingSystem("Gpfl","Simple GPFL interpreter")
		}
		return _self.internalLogger
	}
}
