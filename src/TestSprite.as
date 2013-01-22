package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class TestSprite extends Entity
	{
		
		public function TestSprite(graphic:Class) 
		{
			super(300, 300);
			this.graphic = new Image(graphic);
		}
		
	}

}