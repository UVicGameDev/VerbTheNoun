package vtn.gallery
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class GallerySelector extends Entity
	{
		[Embed(source = '/assets/Arrow_Selector.png')] private const ARROWSELECTOR:Class;
		[Embed(source = '/assets/ButtonSelector.png')] private const BUTTONSELECTOR:Class;
		[Embed(source = '/assets/GameSelector.png')] private const GAMESELECTOR:Class;
		
		public var selection:GallerySelectable;
		private var arrow_graphic:Graphic = new Image(ARROWSELECTOR);
		private var button_graphic:Graphic = new Image(BUTTONSELECTOR);
		private var game_graphic:Graphic = new Image(GAMESELECTOR);
		
		public function GallerySelector(selection:GallerySelectable) 
		{
			super(0, 0);
			this.selection = selection;
			conform_to_selection();
		}
		
		public function move_to(selection:GallerySelectable):void
		{
			this.selection = selection;
			conform_to_selection();
		}
		
		private function conform_to_selection():void 
		{
			if (selection is GalleryArrow)
			{
				graphic = arrow_graphic;
			}
			else if (selection is GalleryButton)
			{
				graphic = button_graphic;
			}
			else 
			{
				graphic = game_graphic;
			}
			x = selection.x - 10;
			y = selection.y - 10;
		}
	}
}