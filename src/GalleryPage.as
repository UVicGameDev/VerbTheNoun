package  
{
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class GalleryPage extends World
	{
		public var page_games:Array = new Array();
		public var game_list:Game_list;
		public const GAMES_PER_PAGE:int = 2;
		
		var leftArrow:GallerySelectable;
		var rightArrow:GallerySelectable;
		var backButton:GallerySelectable;
		var game_index:int;
		var games_list:Game_list;
		
		public function GalleryPage() 
		{
			///*var games:Array = new Array();
			leftArrow = new GalleryArrow(30, 150, -1);
			rightArrow = new GalleryArrow(630, 150, 1);
			backButton = new GalleryButton(230, 400);
			game_index = 0;
			games_list = new Game_list();
			
			add(leftArrow);
			add(rightArrow);
			add(backButton);
			
			fill_gallery_page();
		}
		
		override public function update():void
		{
			
		}
		
		override public function add(subject:Entity):Entity
		{
			if (subject is GameSelectable)
			{
				page_games.push(subject);
			}
			return super.add(subject);
		}
		
		public function fill_gallery_page()
		{
			for (var i:int = 0; i < GAMES_PER_PAGE; i++)
			{
				var next_game:GameSelectable = games_list.game_list[(i + game_index)];
				next_game.x = 180 + (i*220);
				next_game.y = 100;
				add(next_game);
				next_game.display();
			}
		}
		
		public function page_right() {
			clear_page();
			
		}
		
		public function page_left() {
			clear_page();
		}
		
		private function clear_page() {
			FP.world.removeList(page_games);
		}
	}

}