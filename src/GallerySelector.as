package  
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class GallerySelector extends Entity
	{
		public var selection:GallerySelectable;
		
		public function GallerySelector(selection:GallerySelectable) 
		{
			super(0, 0);
			this.selection = selection;
			x = selection.x - 20;
			y = selection.y - 20;
		}
		
	}

}