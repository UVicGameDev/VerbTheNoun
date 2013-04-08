package vtn.gallery
{
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import vtn.main.MainMenuWorld;
	//import MainMenuWorld;
	
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class GalleryPage extends World
	{
		public var page_games:Array = new Array();
		//public var game_list:Game_list;
		public var num_games:int;
		public const MAX_GAMES_PER_PAGE:int = 2;
		
		public var leftArrow:GallerySelectable;
		public var rightArrow:GallerySelectable;
		public var backButton:GallerySelectable;
		public var selector:GallerySelector;
		public var game_index:int;
		public var game_list:Game_list;
		
		public function GalleryPage() 
		{
			///*var games:Array = new Array();
			leftArrow = new GalleryArrow(30, 150, -1);
			rightArrow = new GalleryArrow(630, 150, 1);
			backButton = new GalleryButton(230, 400);
			game_index = 0;
			num_games = 2;
			game_list = new Game_list();
			
			leftArrow.left_link = rightArrow;
			leftArrow.up_link = backButton;
			leftArrow.down_link = backButton;
			
			rightArrow.right_link = leftArrow;
			rightArrow.up_link = backButton;
			rightArrow.down_link = backButton;
			
			backButton.right_link = rightArrow;
			backButton.left_link = leftArrow;
			
			add(leftArrow);
			add(rightArrow);
			add(backButton);
			
			fill_gallery_page();
			
			selector = new GallerySelector(leftArrow);
			add(selector);
		}
		
		override public function update():void
		{
			//check keys and move selector
			if (Input.pressed(Key.RIGHT))
			{
				selector.move_to(selector.selection.right_link);
			}
			if (Input.pressed(Key.LEFT))
			{
				selector.move_to(selector.selection.left_link);
			}
			if (Input.pressed(Key.DOWN))
			{
				selector.move_to(selector.selection.down_link);
			}
			if (Input.pressed(Key.UP))
			{
				selector.move_to(selector.selection.up_link);
			}
			if (Input.pressed(Key.ENTER))
			{
				take_selection_action();
			}
		}
		
		override public function add(subject:Entity):Entity
		{
			if (subject is GameSelectable)
			{
				page_games.push(subject);
			}
			return super.add(subject);
		}
		
		public function fill_gallery_page():void
		{
			for (var i:int = 0; i < num_games; i++)
			{
				var next_game:GameSelectable = new GameSelectable(game_list.game_list[(i + game_index)]);
				next_game.x = 180 + (i*220);
				next_game.y = 100;
				add(next_game);
				//next_game.display();//see if this still does anything
				
				if (i==0)
				{
					next_game.left_link = leftArrow;
					leftArrow.right_link = next_game;
					
					next_game.up_link = backButton;
					backButton.down_link = next_game;
					
					next_game.down_link = backButton;
					
					if (i == num_games - 1)
					{
						next_game.right_link = rightArrow;
						rightArrow.left_link = next_game;
						
						backButton.up_link = next_game;
					}
				}
				else 
				{
					next_game.right_link = rightArrow;
					rightArrow.left_link = next_game;
					
					next_game.up_link = backButton;
					
					next_game.down_link = backButton;
					backButton.up_link = next_game;
					
					next_game.left_link = page_games[0];
					page_games[0].right_link = next_game;
				}
			}
		}
		
		public function take_selection_action():void
		{
			if (selector.selection is GalleryArrow)
			{
				if (((GalleryArrow)(selector.selection)).direction > 0)
				{
					if (!page_right())
						return;
				}
				else
				{
					if (!page_left())
						return;
				}

				if (game_list.game_list.length - 1 - game_index >= MAX_GAMES_PER_PAGE) 
				{
					num_games = MAX_GAMES_PER_PAGE;
				}
				else
				{
					num_games = game_list.game_list.length - game_index;
				}
				fill_gallery_page();
			}
			else if (selector.selection is GalleryButton)
			{
				FP.world = new MainMenuWorld();
			}
			else if (selector.selection is GameSelectable)
			{
				FP.world = ((GameSelectable)(selector.selection)).portal.game();
			}
		}
		
		public function page_right():Boolean 
		{
			if (game_list.game_list.length - game_index - 2 >= MAX_GAMES_PER_PAGE)
			{
				clear_page();
				game_index += 2;
				return true;
			}
			else if (game_list.game_list.length - (game_index + 2) < MAX_GAMES_PER_PAGE 
				&& game_list.game_list.length - (game_index + 2) > 0)
			{
				clear_page();
				game_index += 2;
				num_games = 1;
				return true;
			}
			return false;
		}
		
		public function page_left():Boolean  
		{
			if (game_index - 2 >= 0)
			{
				clear_page();
				game_index -= 2;
				return true;
			}
			return false;
		}
		
		private function clear_page():void  
		{
			FP.world.removeList(page_games);
			page_games = [];
		}
	}

}