package core.util.camera 
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author beyamor
	 */
	public class EntityCamera extends CameraDecorator 
	{
		private var entity:Entity;
		
		public function EntityCamera(entity:Entity, cam:Camera) 
		{
			super(cam);
			
			this.entity = entity;
		}
		
		override public function update():void 
		{
			super.update();
			
			cam.x = entity.x - cam.width / 2;
			cam.y = entity.y - cam.height / 2;
		}
	}

}