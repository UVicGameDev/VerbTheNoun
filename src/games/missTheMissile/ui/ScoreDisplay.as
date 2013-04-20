package games.missTheMissile.ui 
{
	import games.missTheMissile.GameData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ScoreDisplay extends Entity 
	{
		private var data:GameData,
					text:Text;
		
		public function ScoreDisplay(x:Number, y:Number, data:GameData)
		{
			this.data	= data;
			text		= new Text(data.score.toString(), 0, 0, { size: 24, align: 'right' } );
			text.width = width = 300;
			
			super(x, y, text);
		}
		
		override public function update():void 
		{
			super.update();
			
			text.text = data.score.toString();
		}
	}

}