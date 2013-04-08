package vtn.gallery
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class GalleryArrow extends GallerySelectable
	{
		//embed arrow
		[Embed(source = '/assets/Arrow.png')] private const GALLERYARROW:Class;
		public var direction:int;
		
		public function GalleryArrow(x:int, y:int, direction:int) 
		{
			super(x, y);
			this.direction = direction;
			var arrow_image:Image = new Image(GALLERYARROW);
			if (direction < 0)
			{
				arrow_image.flipped = true;
			}
			
			graphic = arrow_image;

		}
	}

}