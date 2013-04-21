package games.missTheMissile.graphics.explosions 
{
	import core.Random;
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Particle;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ExplosionSprite extends Graphic 
	{
		private var graphics:Graphiclist					= new Graphiclist,
					particles:Vector.<ExplosionParticle>	= new Vector.<ExplosionParticle>;
		
		public function ExplosionSprite() 
		{
			active = true;
		
			var numberOfParticles:int	= Random.intInRange(10, 15),
				initialAngle:Number		= Random.angle,
				angleOffset:Number		= Math.PI * 2 / numberOfParticles;
			
			for (var i:uint = 0; i < numberOfParticles; ++i) {
				
				var particle:ExplosionParticle = new ExplosionParticle(initialAngle + angleOffset * i);
				graphics.add(particle);
				particles.push(particle);
			}
		}
		
		override public function update():void 
		{
			super.update();
			graphics.update();
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			graphics.render(target, point, camera);
		}
		
		public function get completed():Boolean {
			
			for each (var particle:ExplosionParticle in particles) {
				
				if (!particle.isDead) return false;
			}
			
			return true;
		}
	}
}