package core.ui.windows.sub 
{
	import core.ui.View;
	import core.ui.windows.main.MainWindow;
	import core.ui.windows.Window;
	import core.util.camera.Camera;
	import core.util.camera.ViewCamera;
	import core.util.UpdateList;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	/**
	 * Cool. This is the guy you'll want to subclass for your own game windows.
	 * It comes complete with its own world, so throw entities in there.
	 * RegularWindow? StandardWindow? WorldfulWindow?
	 * @author beyamor
	 */
	public class SubWindow implements Window
	{		
		// Public variables don't satisfy interface properties
		// Which is so great. Just damn. Glad I have to chug through all this crappy boilerplate.
		private var	_position:Point		= new Point,
					_blocksUpdates:Boolean	= false,
					_parent:Window,
					_view:View,
					_camera:Camera,
					_isFirstUpdate:Boolean			= true,
					_firstUpdateHasPassed:Boolean	= false,
					_updateables:UpdateList			= new UpdateList;
					
		// ugh this sucks everything is awful
		public function get position():Point { return _position; }
		public function set position(newPosition:Point):void { _position = newPosition; }
		
		public function get x():Number { return position.x; }
		public function set x(x:Number):void { position.x = x; }
		
		public function get y():Number { return position.y; }
		public function set y(y:Number):void { position.y = y; }
		
		public function get width():Number { return view.width; }
		public function set width(width:Number):void { view.width = width;  }
		
		public function get height():Number { return view.height; }
		public function set height(height:Number):void { view.height = height; }
		
		public function get blocksUpdates():Boolean { return _blocksUpdates; }
		public function set blocksUpdates(blocksUpdates:Boolean):void { _blocksUpdates = blocksUpdates; }
		
		public function get parent():Window { return _parent; }
		public function set parent(parent:*):void {
			
			if (parent && (parent is Window))	_parent = (parent as Window);
			else 								_parent	= new MainWindow;
		}
		
		public function get buffer():BitmapData { return view.buffer; }
		
		public function get view():View { return _view; }
		
		public function get camera():Camera { return _camera; }
		public function set camera(camera:Camera):void { _camera = camera; }
		
		protected function get isFirstUpdate():Boolean { return _isFirstUpdate; }
		
		public function get updateables():UpdateList { return _updateables; }
		
		public function SubWindow(width:int, height:int)
		{
			_parent	= new MainWindow;
			_view	= new View(width, height);
			_camera	= new ViewCamera(view);
		}
		
		public function centerOnParent():void {
			
			x = parent.x + parent.width / 2 - width / 2;
			y = parent.y + parent.height / 2 - height / 2;
		}
		
		public function update():void {
			
			if (_firstUpdateHasPassed) _isFirstUpdate = false;
			_firstUpdateHasPassed = true;
			
			view.update();
			view.updateLists();
			updateables.update();
			camera.update();
		}
		
		public function render():void {
			
			view.renderTo(parent.buffer, position);
		}
	}

}