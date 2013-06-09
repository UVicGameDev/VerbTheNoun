package core.games 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import vtn.gallery.GalleryPage;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Game 
	{
		
		public function Game() 
		{
			
		}
		
		public function start():void {
			
			FP.world = createGameWorld();
		}
		
		public function restart():void {
			
			FP.world = createGameWorld();
		}
		
		public function quit():void {
			
			FP.world = new GalleryPage;
		}
		
		protected function createGameWorld():World {
			
			throw new Error("Override in subclass");
		}
		
		public function get info():GameInfo {
			
			throw Error("Override in subclass");
		}
	}

}