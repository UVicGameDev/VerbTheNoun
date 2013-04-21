package games.missTheMissile.graphics 
{
	import core.ui.windows.main.MainWindow;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FilledPolygon extends Graphic 
	{
		private var	buffer:BitmapData,
					width:uint,
					height:uint;
					
					
		public var	origin:Point		= new Point,
					direction:Number	= 0,
					offset:Point		= new Point;
					
		public function get lineWidth():Number { return 3; }
		
		public function FilledPolygon(width:uint, height:uint)
		{
			if (width == 0 || height == 0) throw new Error("Dimensions must be greater than zero.");
			
			this.width	= width;
			this.height	= height;
			
			buffer = new BitmapData(width, height, true, 0);
		}
		
		public function draw(color:uint, ... points):void {
			
			var	shape:Shape		= new Shape,
				gfx:Graphics	= shape.graphics;
			
			gfx.beginFill(color, 0.2);
			gfx.lineStyle(lineWidth, color, 0.8);
			
			var p0:Array = points.shift();
			points.push(p0);
			
			gfx.moveTo(p0[0], p0[1]);
			for each (var p:Array in points) {
				
				gfx.lineTo(p[0], p[1]);
			}
			
			gfx.endFill();
			buffer.draw(shape);
		}
		
		public function centerOO():void {
			
			centerOffset();
			centerOrigin();
		}
		
		public function centerOffset():void {
			
			offset.x = width / 2;
			offset.y = height / 2;
		}
		
		public function centerOrigin():void {
			
			origin.x = width / 2;
			origin.y = height / 2;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			
			var drawMatrix:Matrix = new Matrix;
			drawMatrix.translate( -origin.x, -origin.y);
			drawMatrix.rotate(direction);
			drawMatrix.translate(
				point.x - camera.x + offset.x,
				point.y - camera.y + offset.y);
			
			target.draw(buffer, drawMatrix);
		}
		
		public function get left():Number				{ return lineWidth; }
		public function get right():Number				{ return width - lineWidth; }
		public function get top():Number				{ return lineWidth; }
		public function get bottom():Number				{ return height - lineWidth; }
		public function get horizontalCenter():Number	{ return width / 2; }
		public function get verticalCenter():Number		{ return height / 2; }
	}

}