package fr.inria.sed.gpfl.xtext;

import org.eclipse.xtext.linking.ILinkingService;
import org.eclipse.xtext.parser.IAstFactory;
import org.eclipse.xtext.parser.antlr.IAntlrTokenFileProvider;

public class TestCreation extends AbstractGpflRuntimeModule {

	@Override
	public Class<? extends IAstFactory> bindIAstFactory() {
		// TODO Auto-generated method stub
		return super.bindIAstFactory();
	}

	@Override
	public Class<? extends ILinkingService> bindILinkingService() {
		// TODO Auto-generated method stub
		return super.bindILinkingService();
	}

	
	

}
