package fr.inria.sed.gpfl.design;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import org.eclipse.emf.common.util.BasicEList;
import org.eclipse.emf.common.util.EList;


/**
 * The services class used by VSM.
 */

public class Services {
    
//	public static EList<Node> allNodes;
//	/**
//	 * Distinct all node by there value to avoid having twice the same node in the same automata
//	 * @param self list of definition automatas
//	 * @return a list of Node unique by there value
//	 */
//    public EList<Node> distinctNode(Collection<AutomataDefTail> self) {
//    	final EList<Node> returns = new BasicEList<>();
//    	for(var automata: self) {
//    		final List<String> names = new LinkedList<>();
//    		returns.add(automata.getAStateId());
//    		names.add(automata.getAStateId().getName());
//    		for (var trans:automata.getATransition()) {
//    			for (var both: new Node[] {trans.getFrom(), trans.getTo()}) {
//    				if(!names.contains(both.getName())) {
//            			returns.add(both);
//            			names.add(both.getName());
//            		}
//    			}
//    		}
//    		names.clear();
//    	}
//    	allNodes = returns;
//    	return returns;
//    }
//    
//    /**
//     * Get the Node that is graphically represented 
//     * @param self
//     * @return
//     */
//    public Node getCorrespondingNode(Node self) {
//    	for (var node : allNodes) {
//    		if (node.getName().equals(self.getName())) {
//	    		if (node.eContainer().eClass().getName().equals("AutomataDefTail")) {
//	    			if (node.eContainer() == self.eContainer().eContainer())
//	    				return node;
//	    		} else if (node.eContainer().eContainer() == self.eContainer().eContainer())
//	    			return node;
//    		}
//    	}
//    	return null;
//    }
}
