package core.ui.windows.sub 
{
	import core.ui.windows.main.MainWindow;
	import core.ui.windows.Window;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.World;
	/**
	 * Cool. This is the guy you'll want to subclass for your own game windows.
	 * It comes complete with its own world, so throw entities in there.
	 * RegularWindow? StandardWindow? WorldfulWindow?
	 * @author beyamor
	 */
	public class SubWindow implements Window
	{
		public var clearColor:uint = 0xFF00FF00;
		
		// Public variables don't satisfy interface properties
		// Which is so great. Just damn. Glad I have to chug through all this crappy boilerplate.
		private var	_x:Number				= 0,
					_y:Number				= 0,
					_width:Number,
					_height:Number,
					_blocksUpdates:Boolean	= false,
					_buffer:BitmapData,
					_parent:Window,
					_world:World			= new World;
					
		// ugh this sucks everything is awful
		public function get x():Number { return _x; }
		public function set x(x:Number):void { _x = x; }
		
		public function get y():Number { return _y; }
		public function set y(y:Number):void { _y = y; }
		
		public function get width():Number { return _width; }
		public function set width(width:Number):void { _width = width; recreateBuffer(); }
		
		public function get height():Number { return _height; }
		public function set height(height:Number):void { _height = height; recreateBuffer(); }
		
		public function get blocksUpdates():Boolean { return _blocksUpdates; }
		public function set blocksUpdates(blocksUpdates:Boolean):void { _blocksUpdates = blocksUpdates; }
		
		public function get parent():Window { return _parent; }
		public function set parent(parent:*):void {
			
			if (parent && (parent is Window))	_parent = (parent as Window);
			else 								_parent	= new MainWindow;
		}
		
		public function get buffer():BitmapData { return _buffer; }
		
		public function get world():World { return _world; }
		
		public function SubWindow(width:Number, height:Number)
		{
			_parent	= new MainWindow;
			_width	= width;
			_height	= height;
			recreateBuffer();
		}
		
		private function recreateBuffer():void {
			
			_buffer = new BitmapData(width, height, true, clearColor);
		}
		
		public function centerOnParent():void {
			
			x = parent.x + parent.width / 2 - width / 2;
			y = parent.y + parent.height / 2 - height / 2;
		}
		
		public function update():void {
			
			world.update();
			world.updateLists();
		}
		
		protected function clearBuffer():void {
			
			buffer.fillRect(new Rectangle(0, 0, width, height), clearColor);
		}
		
		public function render():void {
			
			clearBuffer();
			
			parent.buffer.copyPixels(
				buffer,
				new Rectangle(0, 0, width, height),
				new Point(x, y));
		}
	}

}