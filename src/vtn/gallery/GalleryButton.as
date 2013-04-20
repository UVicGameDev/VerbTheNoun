package vtn.gallery
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class GalleryButton extends GallerySelectable
	{
		[Embed(source = '/assets/ButtonBackground.png')] private const GALLERYBUTTON:Class;
		public function GalleryButton(x:int, y:int) 
		{
			super(x, y);
			graphic = new Image(GALLERYBUTTON);
		}
		
	}

}