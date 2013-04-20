package vtn.gallery.test
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class TestWorld extends World
	{
		
		public function TestWorld(graphic:Class) 
		{
			super();
			add(new TestSprite(graphic))
		}
		
	}

}