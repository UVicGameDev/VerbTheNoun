package games.missTheMissile.graphics 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import games.missTheMissile.entities.Missile;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissileSprite extends Graphic 
	{
		private var	missile:Missile,
					shape:FilledPolygon;
		
		public function MissileSprite(missile:Missile)
		{
			this.missile = missile;
			
			shape = new FilledPolygon(missile.width, missile.height);
			
			shape.draw(
				0xDE1616,
				[shape.left + 5, shape.verticalCenter - 7],
				[shape.right - 10, shape.verticalCenter - 7],
				[shape.right, shape.verticalCenter],
				[shape.right - 10, shape.verticalCenter + 7],
				[shape.left + 5, shape.verticalCenter + 7]
			);
			
			shape.draw(
				0x999999,
				[shape.left, shape.verticalCenter - 6],
				[shape.left + 5 - shape.lineWidth, shape.verticalCenter - 4],
				[shape.left + 5 - shape.lineWidth, shape.verticalCenter + 4],
				[shape.left, shape.verticalCenter + 6]
			);
			
			shape.centerOO();
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			shape.direction = missile.direction;
			shape.render(target, point, camera);
		}
	}

}