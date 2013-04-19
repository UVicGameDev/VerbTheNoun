package games.missTheMissile.ui 
{
	import core.ui.menus.Selectable;
	import flash.text.TextFormatAlign;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MenuOption extends Entity implements Selectable 
	{
		private var	onSelection:Function,
					label:String,
					text:Text;
		
		public function MenuOption(x:Number, y:Number, label:String, onSelection:Function)
		{
			this.onSelection	= onSelection;
			this.label			= label;
			
			text		= new Text(regularLabel, -100, 0, {size:32, align:"center"});
			text.width	= 200;
			
			super(x, y, text);
		}
		
		private function get regularLabel():String { return label; }
		private function get highlightLabel():String { return '-' + label + '-'; }
		
		/* INTERFACE core.ui.menus.Selectable */
		
		public function highlight():void 
		{
			text.text = highlightLabel;
		}
		
		public function removeHighlight():void 
		{
			text.text = regularLabel;
		}
		
		public function select():void 
		{
			onSelection();
		}
		
	}

}