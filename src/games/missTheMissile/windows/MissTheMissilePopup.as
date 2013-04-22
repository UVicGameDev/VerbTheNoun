package games.missTheMissile.windows 
{
	import core.Game;
	import core.ui.menus.SelectionList;
	import core.ui.menus.VerticalSelectionList;
	import core.ui.windows.sub.Popup;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.ui.MenuOption;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import vtn.gallery.GalleryPage;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissilePopup extends Popup 
	{
		protected var game:MissTheMissile,
					options:SelectionList;
		
		public function MissTheMissilePopup(title:String, game:MissTheMissile) 
		{
			super(400, 300, game.windows);
			
			this.game = game;
			
			//clearColor = 0x33FFFFFF;
			clearColor = 0xFFFF0000;
			centerOnParent();
			
			blocksUpdates = true;
			
			options = new VerticalSelectionList;
			var optionElements:Vector.<MenuOption> = createOptions();
			options.addAll(optionElements);
			
			for (var index:uint = 0; index < optionElements.length; ++index) {
				
				var option:MenuOption = optionElements[index];
				
				option.x = width / 2 - option.width / 2;
				option.y = 100 + 40 * index;
				
				view.add(option);
			}
			
			var	titleGraphic:Text	= new Text(title, 0, 0, { size:48 } ),
				titleElement:Entity	= view.addGraphic(titleGraphic, 0, 0, 20);
			
			titleElement.x = width / 2 - titleGraphic.width / 2;
		}
		
		override public function update():void 
		{
			super.update();
			
			options.update();
		}
		
		protected function createRestartOption():MenuOption {
			
			return new MenuOption("restart", function():void {
				FP.world = new MissTheMissile;
			});
		}
		
		protected function createQuitOption():MenuOption {
			
			return new MenuOption("quit", function():void {
				FP.world = new GalleryPage;
			});
		}
		
		protected function createOptions():Vector.<MenuOption> {
			
			// Override in subclass
			return null;
		}
	}

}