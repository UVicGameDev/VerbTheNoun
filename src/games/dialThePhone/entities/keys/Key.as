package games.dialThePhone.entities.keys 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Key extends Entity
	{		
		public function Key(x:Number, y:Number, graphic:Graphic)
		{			
			super(x, y, graphic);
			
			layer	= 10;
			type	= "key";
		}
		
		public function press():void {
			
			// Override in subclasses
		}
	}

}