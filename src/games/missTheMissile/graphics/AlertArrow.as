package games.missTheMissile.graphics 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Canvas;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class AlertArrow extends Graphic 
	{
		private static const	WIDTH:Number				= 40,
								HEIGHT:Number				= 40,
								START_OF_TRIANGLE:Number	= WIDTH * 0.35,
								TRIANGLE_INDENT:Number		= HEIGHT * 0.25,
								OUTLINE_THICKNESS:Number	= 3;
		
		private var previousDirection:Number = 0,
					color:uint,
					buffer:BitmapData,
					rotationMatrix:Matrix;
		
		public function AlertArrow(color:uint)
		{
			this.color = color;
			redraw(0);
		}
		
		public function set direction(direction:Number):void {
			
			if (direction == previousDirection) return;
			
			previousDirection = direction;
			redraw(direction);
		}
		
		private function redraw(direction:Number):void {
			
			var shape:Shape	= new Shape,
			gfx:Graphics	= shape.graphics;
			
			// So, like the arrow face right, y'know? =>
			gfx.beginFill(color, 0.2);
			gfx.lineStyle(OUTLINE_THICKNESS, color, 0.8);
			
			// The pointy bit
			gfx.moveTo(START_OF_TRIANGLE, HEIGHT - TRIANGLE_INDENT);
			gfx.lineTo(START_OF_TRIANGLE, HEIGHT - OUTLINE_THICKNESS);
			gfx.lineTo(WIDTH - OUTLINE_THICKNESS, HEIGHT / 2);
			gfx.lineTo(START_OF_TRIANGLE, OUTLINE_THICKNESS);
			gfx.lineTo(START_OF_TRIANGLE, TRIANGLE_INDENT);
			
			// The rectangly bit
			gfx.lineTo(OUTLINE_THICKNESS, TRIANGLE_INDENT);
			gfx.lineTo(OUTLINE_THICKNESS, HEIGHT - TRIANGLE_INDENT);
			gfx.lineTo(START_OF_TRIANGLE, HEIGHT - TRIANGLE_INDENT);
			
			gfx.endFill();
			
			rotationMatrix = new Matrix;
			rotationMatrix.translate(-WIDTH / 2, -HEIGHT / 2);
			rotationMatrix.rotate(direction);
			rotationMatrix.translate(WIDTH / 2, HEIGHT / 2);
			
			buffer = new BitmapData(WIDTH, HEIGHT, true, 0);
			buffer.draw(shape, rotationMatrix);
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			
			var tip:Point			= rotationMatrix.transformPoint(new Point(WIDTH, HEIGHT / 2)),
				drawMatrix:Matrix	= new Matrix;
				
			drawMatrix.translate(point.x - camera.x - tip.x, point.y - camera.y - tip.y);
			target.draw(buffer, drawMatrix);
		}
		
		public function faceUp():void			{ direction = -Math.PI * 0.5; }
		public function faceDown():void			{ direction = Math.PI * 0.5; }
		public function faceRight():void		{ direction = 0; }
		public function faceLeft():void			{ direction = Math.PI; }
		public function faceUpRight():void		{ direction = -Math.PI * 0.25; }
		public function faceUpLeft():void		{ direction = -Math.PI * 0.75; }
		public function faceDownRight():void	{ direction = Math.PI * 0.25; }
		public function faceDownLeft():void		{ direction = Math.PI * 0.75; }
	}

}