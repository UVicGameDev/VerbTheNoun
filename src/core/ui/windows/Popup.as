package core.ui.windows 
{
	import core.Game;
	import core.Keys;
	import core.ui.windows.WindowStack;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Popup extends SubWindow 
	{
		private var		stack:WindowStack,
						closeCallbacks:Vector.<Function>	= new Vector.<Function>;
		protected var	canBeClosed:Boolean	= true;
		
		public function Popup(width:Number, height:Number, stack:WindowStack)
		{
			super(width, height);
			
			this.stack = stack;
			
			blocksUpdates = true;
		}
		
		public function close():void {
			
			if (stack.top == this) stack.pop();
			for each (var callback:Function in closeCallbacks) callback();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (canBeClosed && Input.pressed(Keys.CANCEL)) close();
		}
		
		public function set onClose(callback:Function):void {
			
			closeCallbacks.push(callback);
		}
	}

}