package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class GallerySelectable extends Entity
	{
		
		
		public var left_link:GallerySelectable;
		public var right_link:GallerySelectable;
		public var up_link:GallerySelectable;
		public var down_link:GallerySelectable;
		
		//public var action:int;//not sure about this part
		
		public function GallerySelectable(x:int, y:int)//Will take paramaters for game and sprite listings and world 
		{
			super(x, y);
			/*image_list.add(new Image(GAMESELECTION));
			graphic = image_list;*/
			//graphic = new Image(GAMESELECTION);
			//this action = action;	
		}
		
		public function display():void
		{
			//graphic = image_list;
			//portal.display()
		}
	}

}