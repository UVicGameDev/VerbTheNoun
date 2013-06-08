package core.ui.menus.pause 
{
	import core.ui.menus.Hightlightable;
	import core.ui.menus.HighlightableSelector;
	import net.flashpunk.FP;
	import vtn.gallery.GalleryPage;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class QuitOption extends HighlightableSelector 
	{
		
		public function QuitOption(highlightable:Hightlightable) 
		{
			super(highlightable);
		}
		
		override public function select():void 
		{
			FP.world = new GalleryPage;
		}
	}

}