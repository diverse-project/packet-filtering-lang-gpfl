/*
 * generated by Xtext 2.27.0
 */
package fr.inria.sed.gpfl.xtext


/**
 * Initialization support for running Xtext languages without Equinox extension registry.
 */
class GpflStandaloneSetup extends GpflStandaloneSetupGenerated {

	def static void doSetup() {
		new GpflStandaloneSetup().createInjectorAndDoEMFRegistration()
	}
}