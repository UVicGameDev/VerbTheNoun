package HeartTheBeets 
{
	import net.flashpunk.Entity;			
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import vtn.main.MainMenuWorld;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class HTB_menu extends Entity
	{
		private var scoreText:GameText;
		private var replayText:GameText;
		private var exitText:GameText;
		
		private const NEWGAME:int = 0;
		private const GOTOMENU:int = 1;
		
		private var selection:int = NEWGAME;
		
		public function HTB_menu(game_complete:Boolean) 
		{
			super(0, 0);
			if (game_complete)
			{
				scoreText = new GameText(200, 100, 
									"RAINDROPS ABSORBED: " + (FP.world as HeartTheBeetsWorld).points
									+ "\n BEET HAPPINESS" + (FP.world as HeartTheBeetsWorld).net_happiness
									+ "\n\nTOTAL SCORE: " + ((FP.world as HeartTheBeetsWorld).points + (FP.world as HeartTheBeetsWorld).net_happiness));					
			
				replayText = new GameText(50, 300, "ENTER TO PLAY AGAIN");
			}
			else {
				scoreText = new GameText(200, 100, "HEART THE BEETS");
				replayText = new GameText(50, 300, "ENTER TO PLAY");
			}
			exitText = new GameText(300, 300, "ESC TO GO BACK TO MAIN MENU")
			
			scoreText.set_text_color(0xFFFF00);
			replayText.set_text_color(0xFFFF00);
			exitText.set_text_color(0xFFFF00);
			
			FP.world.add(scoreText);
			FP.world.add(replayText);
			FP.world.add(exitText);
		}
		
		override public function update():void
		{
			
			if (Input.pressed(Key.LEFT))
			{
				selection -= 1;
			}
			else if (Input.pressed(Key.RIGHT))
			{
				selection += 1;
			}
			
			selection %= 2;
			
			if (selection < 0)
			{
				selection *= -1;
			}
			
			switch(selection)
			{
				case 0:
					replayText.set_text_color(0x33CC33);
					exitText.set_text_color(0xFFFF00);
					break;
				case 1:
					replayText.set_text_color(0xFFFF00);
					exitText.set_text_color(0x33CC33);
					break;
			}
			
			if(Input.pressed(Key.ENTER))
			{
				(FP.world as HeartTheBeetsWorld).reset_game();
			}
			
			if(Input.pressed(Key.ESCAPE))
			{
				FP.world = new MainMenuWorld();
			}
		}
		
	}

}