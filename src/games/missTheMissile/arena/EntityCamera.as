package games.missTheMissile.arena 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class EntityCamera 
	{
		private var	entity:Entity,
					arena:Arena;
		
		public function EntityCamera(entity:Entity, arena:Arena)
		{
			this.entity	= entity;
			this.arena	= arena;
		}
		
		public function update():void {
			
			var x:Number = entity.x - FP.width / 2;
			var y:Number = entity.y - FP.height / 2;
			
			if (x < 0)							x = 0;
			if (x + FP.width > arena.width)		x = arena.width - FP.width;
			if (y < 0)							y = 0;
			if (y + FP.height > arena.height)	y = arena.height - FP.height;
			
			FP.camera.x = x;
			FP.camera.y = y;
		}
	}

}