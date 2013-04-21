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
					
		public var	direction:Number = 0;
					
		private var	shape:FilledPolygon;
		
		public function AlertArrow(color:uint)
		{			
			this.shape = new FilledPolygon(WIDTH, HEIGHT);
			
			shape.draw(
				color,
				
				// The pointy bit
				[START_OF_TRIANGLE, shape.verticalCenter - TRIANGLE_INDENT],
				[START_OF_TRIANGLE, shape.top],
				[shape.right, shape.verticalCenter],
				[START_OF_TRIANGLE, shape.bottom],
				[START_OF_TRIANGLE, shape.verticalCenter + TRIANGLE_INDENT],
				
				// The rectangly bit
				[shape.left, shape.verticalCenter + TRIANGLE_INDENT],
				[shape.left, shape.verticalCenter - TRIANGLE_INDENT]
			);
			
			shape.origin.x = shape.right;
			shape.origin.y = shape.verticalCenter;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			
			shape.direction = this.direction;
			shape.render(target, point, camera);
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