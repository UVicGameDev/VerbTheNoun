package core.ui.windows.sub 
{
	import net.flashpunk.FP;
	/**
	 * This guy represents the Window where the game play actually happens.
	 * If you want your game to take place in a Window, subclass this guy.
	 * The awkward name - PlayWindowBase - is because I'd like to call the subclass PlayWindow.
	 * @author beyamor
	 */
	public class PlayWindowBase extends SubWindow 
	{
		
		public function PlayWindowBase() 
		{
			super(FP.width, FP.height);
		}
		
	}

}