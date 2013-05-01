package core.context 
{
	import core.util.Updateable;
	
	/**
	 * Ah, the simple but sophisticated Enter-Leave-Update state.
	 * While you are by no means required  to subject yourself to the ELU interface,
	 * I found myself repeating it enough to want to formalize it.
	 * @author beyamor
	 */
	public interface ELUState extends Updateable
	{
		function enter():void;
		function leave():void;
	}
	
}