package games.dialThePhone.entities 
{
	import core.GameConsts;
	import games.dialThePhone.graphics.FingerSprite;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Finger extends Entity 
	{
		
		public function Finger(initialX:Number, initialY:Number) 
		{
			super(initialX, initialY, new FingerSprite);
		}
		
	}

}