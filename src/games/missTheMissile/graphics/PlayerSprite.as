package games.missTheMissile.graphics 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import games.missTheMissile.entities.Player;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerSprite extends Graphic 
	{
		private var	player:Player,
					shape:FilledPolygon;
		
		public function PlayerSprite(player:Player)
		{
			this.player = player;
			
			shape = new FilledPolygon(player.width, player.height);
			
			shape.draw(
				0xFFFFFF,			
				[shape.left, shape.top],
				[shape.right, shape.verticalCenter],
				[shape.left, shape.bottom]
			);
			
			shape.centerOO();
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			shape.direction = player.direction;
			shape.render(target, point, camera);
		}
	}

}