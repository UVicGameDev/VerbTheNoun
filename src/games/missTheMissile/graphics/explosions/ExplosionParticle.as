package games.missTheMissile.graphics.explosions 
{
	import core.ui.windows.Popup;
	import flash.geom.Point;
	import core.Random;
	import flash.display.BitmapData;
	import games.missTheMissile.graphics.FilledPolygon;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ExplosionParticle extends Graphic 
	{
		private var shape:FilledPolygon,
					direction:Number,
					speed:Number,
					elapsed:Number			= 0,
					life:Number;
					
		private function get percentElapsed():Number { return elapsed / life; }
		public function get isDead():Boolean { return elapsed > life; }
		
		public function ExplosionParticle(direction:Number)
		{
			this.direction = direction;
			
			life	= Random.inRange(0.5, 1);
			speed	= Random.inRange(25, 35);
			
			var color:uint = FP.choose(0xF2782C, 0xFCD41E, 0xFC381E);
			
			shape = new FilledPolygon(16, 12);
			shape.draw(color,
				[shape.left, shape.top],
				[shape.right, shape.verticalCenter],
				[shape.left, shape.bottom]
				/*[shape.left, shape.top],
				[shape.right, shape.top],
				[shape.right, shape.bottom],
				[shape.left, shape.bottom]*/
			);
			shape.direction = direction;
			shape.centerOO();
			
			active = true;
		}
		
		override public function update():void 
		{
			super.update();
			
			elapsed += FP.elapsed;
			
			shape.alpha = (1 - percentElapsed);
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			
			if (isDead) return;
			
			var offset:Point = new Point;
			
			offset.x = speed * percentElapsed * Math.cos(direction);
			offset.y = speed * percentElapsed * Math.sin(direction);
			
			shape.render(target, point.add(offset), camera);
		}
		
	}

}