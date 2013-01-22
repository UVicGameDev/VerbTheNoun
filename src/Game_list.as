package  
{
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Game_list 
	{
		public var game_list:Array;
		
		//Embedd Game selectable 
		[Embed(source = 'assets/game_standin_red.png')] private const REDSTANDIN:Class;
		[Embed(source = 'assets/game_standin_green.png')] private const GREENSTANDIN:Class;
		[Embed(source = 'assets/game_standin_yellow.png')] private const YELLOWSTANDIN:Class;
		[Embed(source = 'assets/game_standin_blue.png')] private const BLUESTANDIN:Class;
		[Embed(source = 'assets/game_standin_violet.png')] private const VIOLETSTANDIN:Class;
		
		public function Game_list() 
		{
			game_list = new Array();
			game_list.push(new GameSelectable(new GamePortal(new TestWorld(REDSTANDIN), REDSTANDIN)));
			game_list.push(new GameSelectable(new GamePortal(new TestWorld(GREENSTANDIN), GREENSTANDIN)));
			game_list.push(new GameSelectable(new GamePortal(new TestWorld(YELLOWSTANDIN), YELLOWSTANDIN)));
			game_list.push(new GameSelectable(new GamePortal(new TestWorld(BLUESTANDIN), BLUESTANDIN)));
			game_list.push(new GameSelectable(new GamePortal(new TestWorld(VIOLETSTANDIN), VIOLETSTANDIN)));
		}	
	}

}