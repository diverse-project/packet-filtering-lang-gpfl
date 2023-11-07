/*
 * generated by Xtext 2.27.0
 */
package fr.inria.sed.gpfl.xtext.ide

import com.google.inject.Guice
import fr.inria.sed.gpfl.xtext.GpflRuntimeModule
import fr.inria.sed.gpfl.xtext.GpflStandaloneSetup
import org.eclipse.xtext.util.Modules2

/**
 * Initialization support for running Xtext languages as language servers.
 */
class GpflIdeSetup extends GpflStandaloneSetup {

	override createInjector() {
		Guice.createInjector(Modules2.mixin(new GpflRuntimeModule, new GpflIdeModule))
	}
	
}
