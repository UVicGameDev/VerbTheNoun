package games.missTheMissile 
{
	import core.Debug;
	import core.Game;
	import games.missTheMissile.windows.PauseWindow;
	import games.missTheMissile.windows.PlayWindow;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissile extends Game 
	{					
		public function MissTheMissile() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Miss the Missile"));
			
			windows.push(
				new PlayWindow()//,
				//new PauseWindow()
			);
		}
	}

}