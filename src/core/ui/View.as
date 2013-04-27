package core.ui 
{
	import core.util.Updateable;
	import core.util.UpdateList;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	/**
	 * Okay. Uh. A view.
	 * So, it's basically just a world with its own render target.
	 * So, you can add entities to it as normal, but have them render to some bitmapdata.
	 * A window, as an example, has a view.
	 * @author beyamor
	 */
	public class View extends World
	{
		private var _buffer:BitmapData,
					_updateables:UpdateList = new UpdateList,
					_updater:Updateable;
					
		public var clearColor:uint = 0;
		
		/**
		 * During an update step, a world's method must be called *and* its lists must be updated.
		 * Rather than have a view update its lists in its update, we will, for consistency, keep the methods separate.
		 * The updateable representation of a view is its updater.
		 */
		public function get updater():Updateable {
			
			if (!_updater) _updater = new ViewUpater(this);
			return _updater;
		}
		
		public function View(width:int, height:int) 
		{
			_buffer = new BitmapData(width, height, true, 0);
		}
		
		public function get updateables():UpdateList {
			
			return _updateables;
		}
		
		public function get buffer():BitmapData {
			
			return _buffer;
		}
		
		public function get width():int {
			
			return _buffer.width;
		}
		
		public function set width(newWidth:int):void {
			
			_buffer = new BitmapData(newWidth, height, true, 0);
		}
		
		public function get height():int {
			
			return _buffer.height;
		}
		
		public function set height(newHeight:int):void {
			
			_buffer = new BitmapData(width, newHeight, true, 0);
		}
		
		override public function add(e:Entity):Entity 
		{
			super.add(e);
			e.renderTarget = buffer;
			return e;
		}
		
		override public function remove(e:Entity):Entity 
		{
			super.remove(e);
			if (e.renderTarget == buffer) e.renderTarget = null;
			return e;
		}
		
		public function copyToBuffer(someBuffer:BitmapData, offset:Point = null):void {
			
			if (!offset) offset = new Point;
			
			someBuffer.copyPixels(
				buffer,
				buffer.rect,
				offset,
				buffer,
				null,
				true);
		}
		
		override public function render():void 
		{
			clearBuffer();
			super.render();
		}
		
		public function renderTo(someBuffer:BitmapData, offset:Point = null):void {
			
			render();
			copyToBuffer(someBuffer, offset);
		}
		
		override public function update():void 
		{
			super.update();
			updateables.update();
		}
		
		public function clearBuffer():void {
			
			buffer.fillRect(buffer.rect, clearColor);
		}
	}

}
import core.util.Updateable;
import core.ui.View;

/**
 * This updateable updates its view, then updates its view's lists.
 */
class ViewUpater implements Updateable {
	
	private var view:View;
	
	public function ViewUpater(view:View) {
		
		this.view = view;
	}
	
	public function update():void {
		
		view.update();
		view.updateLists();
	}
}