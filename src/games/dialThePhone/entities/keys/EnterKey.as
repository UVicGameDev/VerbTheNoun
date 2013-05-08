package games.dialThePhone.entities.keys 
{
	import games.dialThePhone.graphics.EnterKeySprite;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class EnterKey extends Key 
	{
		
		public function EnterKey(x:Number, y:Number) 
		{
			super(x, y, new EnterKeySprite);
			
			width = 64;
			height = 72;
		}
		
	}

}