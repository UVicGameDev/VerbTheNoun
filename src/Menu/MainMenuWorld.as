package  
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Nick Pettyjohn
	 */
	public class MainMenuWorld extends MenuWorld
	{	
		// Keep track of entities so we can move them in transitions
		// and handle button selection
		private var title:TextEntity;
		private var playButton:ButtonEntity;
		private var optionsButton:ButtonEntity;
		
		public function MainMenuWorld()
		{
			// Initialize title
			title = new TextEntity("UVGD Verb The Noun", Width / 2, Height / 3 - 100, 30);
			
			// Initialize buttons at positions
			playButton = new ButtonEntity("Play", Width / 2, Height / 2);
			optionsButton = new ButtonEntity("Options", Width / 2, Height / 2 + 100);
			
			playButton.isSelected = true; // start with playButton selected
			
			// Add entities
			AddEntity(title);
			AddEntity(playButton);
			AddEntity(optionsButton);
			
			SetTransitionOn();
		}	
		/* Checks which button is selected, then changes FP.world
		 * to the respective world.
		 */
		override protected function HandleSelect():void
		{
			if (playButton.isSelected){
				trace("PlayButton Activated!");
			} else {
				SetTransitionOff();
				//FP.world = new OptionsMenuWorld();
			}
		}
		/* Checks which button is selected, and selects the 
		 * opposite one, since there are only 2 buttons.
		 */
		override protected function HandleNavigation(dir:int):void
		{
			if (playButton.isSelected){
				optionsButton.isSelected = true;
				playButton.isSelected = false;
			} else {
				playButton.isSelected = true;
				optionsButton.isSelected = false;
			}
		}
		override protected function Transition():void
		{
			if (playButton.isSelected){
				trace("PlayButton Activated!");
			} else {
				FP.world = new OptionsMenuWorld();
			}
		}
	}
}