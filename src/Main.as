package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(800, 800, 60, false);

			FP.world = new GalleryPage;
			//FP.console.enable();
		}
		
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
		
	}
	
}