package games.missTheMissile.graphics 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import games.missTheMissile.entities.Player;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerSprite extends Graphic 
	{
		private var	player:Player,
					buffer:BitmapData;
		
		public function PlayerSprite(player:Player)
		{
			this.player = player;
			redrawBuffer();
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			
			var drawMatrix:Matrix = new Matrix;
			drawMatrix.translate( -player.halfWidth, -player.halfHeight);
			drawMatrix.rotate(player.direction);
			drawMatrix.translate(
				point.x - camera.x + player.halfWidth,
				point.y - camera.y + player.halfHeight);
			
			target.draw(buffer, drawMatrix);
		}
		
		private function redrawBuffer():void {
			
			var	shape:Shape		= new Shape,
				gfx:Graphics	= shape.graphics;
				
			// Copying this from AlertArrow. Dunno exactly how I want to unify the aesthetics yet.
			const	color:uint			= 0xFFFFFF,
					lineWidth:Number	= 3;
			
			gfx.beginFill(color, 0.2);
			gfx.lineStyle(lineWidth, color, 0.8);
			
			gfx.moveTo(lineWidth, lineWidth);
			gfx.lineTo(player.width - lineWidth, player.height / 2);
			gfx.lineTo(lineWidth, player.height - lineWidth);
			gfx.lineTo(lineWidth, lineWidth);
			
			gfx.endFill();
			
			buffer = new BitmapData(player.width, player.height, true, 0);
			buffer.draw(shape);
		}
	}

}