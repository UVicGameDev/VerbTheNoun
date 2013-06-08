package core.ui.menus 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class HighlightableEntity extends Entity implements Hightlightable 
	{
		
		public function HighlightableEntity(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
		}
		
		/* INTERFACE core.ui.menus.Hightlightable */
		
		public function highlight():void 
		{
			throw new Error("Override in subclass");
		}
		
		public function removeHighlight():void 
		{
			throw new Error("Override in subclass");
		}
		
	}

}