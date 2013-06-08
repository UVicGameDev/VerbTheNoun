package games.missTheMissile.ui 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.menus.Hightlightable;
	import core.ui.menus.Selectable;
	import flash.text.TextFormatAlign;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MenuOption extends HighlightableEntity implements Selectable
	{
		private var	onSelection:Function,
					label:String,
					text:Text;
		
		public function MenuOption(label:String, onSelection:Function)
		{
			this.onSelection	= onSelection;
			this.label			= label;
			
			text	= new Text(regularLabel, 0, 0, { size:32 } );
			width	= text.width;
			
			super(0, 0, text);
		}
		
		private function get regularLabel():String { return ' ' + label + ' '; }
		private function get highlightLabel():String { return '-' + label + '-'; }
		
		/* INTERFACE core.ui.menus.Selectable */
		
		override public function highlight():void 
		{
			text.text = highlightLabel;
		}
		
		override public function removeHighlight():void 
		{
			text.text = regularLabel;
		}
		
		public function select():void 
		{
			onSelection();
		}
		
	}

}