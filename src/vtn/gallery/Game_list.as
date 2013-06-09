package vtn.gallery
{
	import core.games.Game;
	import games.dialThePhone.DialThePhone;
	import games.missTheMissile.MissTheMissile;
	import games.repeatTheLevel.RepeatTheLevel;
	import HeartTheBeets.HeartTheBeets;
	import HeartTheBeets.Cloud;
	import net.flashpunk.World;
	import vtn.gallery.test.TestWorld;
	
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Game_list 
	{
		public var game_list:Vector.<GamePortal>;
		
		public function Game_list() 
		{
			var allGames:Vector.<Class> = new <Class>[
				MissTheMissile,
				RepeatTheLevel,
				HeartTheBeets,
				DialThePhone
			];
			
			game_list = new Vector.<GamePortal>;
			for each (var gameClass:Class in allGames) game_list.push(new GamePortal(new gameClass));
		}	
	}

}