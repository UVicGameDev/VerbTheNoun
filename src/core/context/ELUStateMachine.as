package core.context 
{
	import core.util.Updateable;
	import flash.utils.Dictionary;
	/**
	 * The ELU state machine is built of ELU states.
	 * As you might expect, only the current state is updated.
	 * 
	 * The states are keyed by strings, so if you're at all worried about compile-time validation,
	 * maybe look somewhere else.
	 * @author beyamor
	 */
	public class ELUStateMachine implements Updateable
	{
		/**
		 * Creates a new state machine which starts in the given initial state.
		 * The states object provided should be an object whose property keys are the names of states
		 * and whose property values are the ELU state objects themselves.
		 * 
		 * For example,
		 * new ELUStateMachine(
		 * 	"harder", {
		 * 		harder:		new HarderState,
		 * 		better:		new BetterState,
		 * 		faster:		new FasterState,
		 * 		stronger:	new StrongState
		 *	});
		 */
		public function ELUStateMachine(initialState:String, states:Object) 
		{
			registerStates(states);
			switchTo(initialState);
		}
		
		/**
		 * Adds more states, again as an object of state names to state objects.
		 */
		public function registerStates(states:Object):void {
			
			for (var stateName:String in states) {
				
				registerState(stateName, states[stateName]);
			}
		}
		
		/**
		 * Adds a single state.
		 */
		public function registerState(stateName:String, state:ELUState):void {
			
			states[stateName] = state;
		}
		
		/**
		 * Updates the current state and transitions to the next state if one is pending.
		 */
		public function update():void {
			
			if (currentState) currentState.update();
			
			if (nextState) {
				
				if (currentState) currentState.leave();
				currentState = nextState;
				nextState = null;
				currentState.enter();
			}
		}
		
		/**
		 * Transitions to another state.
		 * Throws if the name provided is not that of a registered state.
		 */
		public function switchTo(nameOfNextState:String):void {
			
			if (!states[nameOfNextState]) throw new Error("Uknown state: " + nameOfNextState);
			
			nextState = states[nameOfNextState];
		}
		
		private var	states:Dictionary = new Dictionary,
					currentState:ELUState,
					nextState:ELUState;
	}

}