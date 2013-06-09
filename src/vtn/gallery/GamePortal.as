package vtn.gallery
{
	import core.games.Game;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Graphic;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class GamePortal extends Entity
	{
		
		/*public function GamePortal() extends Entity
		{
			super(0, 0);
		}
		*/
		public var game:Game;
		private var game_graphic:Graphic;
		
		public function GamePortal(game:Game, game_graphic:Class) 
		{
			super(0,0);
			this.game_graphic = new Image(game_graphic);
			this.game = game;
		}
		
		public function get_game_graphic(x:int, y:int):Graphic
		{
			game_graphic.x = x;
			game_graphic.y = y;
			return game_graphic;
		}
		
		
	}

}