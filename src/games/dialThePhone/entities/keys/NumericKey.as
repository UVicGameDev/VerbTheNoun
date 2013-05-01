package games.dialThePhone.entities.keys 
{
	import core.Debug;
	import games.dialThePhone.graphics.NumericKeySprite;
	/**
	 * ...
	 * @author beyamor
	 */
	public class NumericKey extends Key 
	{	
		private var number:uint;
		
		public function NumericKey(number:uint, x:Number, y:Number) 
		{
			this.number = number;
			
			super(x, y, new NumericKeySprite(number));
			
			width	= 48;
			height	= 48;
		}
		
		override public function press():void 
		{
			super.press();
			
			Debug.log("Pressed number " + number);
		}
	}

}