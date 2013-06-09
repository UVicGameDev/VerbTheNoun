package core.games 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import vtn.gallery.GalleryPage;
	
	/**
	 * So, okay. Games. Let's talk.
	 * 
	 * A game provides top-level control methods - start, restart, and quit.
	 * More important still, it serves as the launch point for a particular VtN game.
	 * 
	 * Each game should have its own Game subclass. This specialized Game must do two things:
	 * 		- override createGameWorld to supply the World in which the game is played
	 * 		- override info to supply the game-specific information (e.g. title, author, etc.)
	 * 
	 * @author beyamor
	 */
	public class Game 
	{		
		/**
		 * Starts a game and switch's to the game's world
		 */
		public function start():void {
			
			FP.world = createGameWorld();
		}
		
		/**
		 * Restarts the game
		 */
		public function restart():void {
			
			FP.world = createGameWorld();
		}
		
		/**
		 * Quits the game, returning to the gallery
		 */
		public function quit():void {
			
			FP.world = new GalleryPage;
		}
		
		/**
		 * Creates the game's world.
		 * Override this in subclasses with game-specific worlds.
		 */
		protected function createGameWorld():World {
			
			throw new Error("Override in subclass");
		}
		
		/**
		 * Supplies the game's info.
		 * Override this in subclasses to provide particular game descriptions.
		 */
		public function get info():GameInfo {
			
			throw Error("Override in subclass");
		}
	}

}