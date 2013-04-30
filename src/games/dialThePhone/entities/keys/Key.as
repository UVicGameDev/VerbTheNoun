package games.dialThePhone.entities.keys 
{
	import core.Debug;
	import games.dialThePhone.graphics.KeySprite;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Key extends Entity 
	{
		private var	label:String
		
		public function Key(label:String, x:Number, y:Number)
		{
			this.label = label;
			
			super(x, y, new KeySprite(label));
			
			// TODO: Make these values less arbitrary
			width = 32;
			height = 32;
			
			layer	= 10;
			type	= "key";
		}
		
		public function press():void {
			
			// Override in subclasses
			Debug.log("Pressed " + label);
		}
	}

}