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
	public class View extends World implements Updateable
	{
		private var _buffer:BitmapData,
					_updateables:UpdateList = new UpdateList;
		
		public function View(initialBuffer:BitmapData) 
		{
			buffer = initialBuffer;
		}
		
		public function get updateables():UpdateList {
			
			return _updateables;
		}
		
		public function get buffer():BitmapData {
			
			return _buffer;
		}
		
		public function set buffer(newBuffer:BitmapData):void {
			
			_buffer = newBuffer;
			
			var all:Vector.<Entity> = new Vector.<Entity>;
			getAll(all);
			
			for each (var entity:Entity in all) entity.renderTarget = buffer;
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
		
		public function renderTo(someBuffer:BitmapData, offset:Point = null):void {
			
			render();
			copyToBuffer(someBuffer, offset);
		}
		
		override public function update():void 
		{
			super.update();
			updateables.update();
		}
	}

}