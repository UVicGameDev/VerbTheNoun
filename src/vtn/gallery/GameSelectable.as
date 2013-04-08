package vtn.gallery
{
	import flash.net.FileReference;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class GameSelectable extends GallerySelectable
	{
		
		[Embed(source = '/assets/Selection_Background.png')] private const GAMESELECTION:Class;
		
		public var image_list:Graphiclist = new Graphiclist();
		public var portal:GamePortal;
		
		public function GameSelectable(portal:GamePortal)
		{
			super(0, 0);
			this.portal = portal;
			image_list.add(new Image(GAMESELECTION));
			image_list.add(portal.get_game_graphic(10,10));
			graphic = image_list;
		}
	}
}