package HeartTheBeets 
{
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Beet extends HeartTheBeetsEntity
	{
		[Embed(source = 'HTB_assets/BeetColor.png')] private const BEET_BODY_COLOR:Class;
		[Embed(source = 'HTB_assets/BeetTopColor.png')] private const BEET_TOP_COLOR:Class;
		[Embed(source = 'HTB_assets/BeetStalk.png')] private const BEET_STALK:Class;
		[Embed(source = 'HTB_assets/BeetOutline.png')] private const BEET_BODY_OUTLINE:Class;
		[Embed(source = 'HTB_assets/BeetTopOutline.png')] private const BEET_TOP_OUTLINE:Class;
		[Embed(source = 'HTB_assets/BeetExpression_strip17.png')] private const BEET_EXPRESSION:Class;
		[Embed(source = 'HTB_assets/PlayerHands_strip2.png')] private const HANDS:Class;
		
		private var beet_body_color:Image = new Image(BEET_BODY_COLOR);
		private var beet_top_color:Image = new Image(BEET_TOP_COLOR);
		private var beet_body_outline:Image = new Image(BEET_BODY_OUTLINE);
		private var beet_top_outline:Image = new Image(BEET_TOP_OUTLINE);
		private var beet_expression:Spritemap = new Spritemap(BEET_EXPRESSION, 32,32);
		private var beet_stalk:Image = new Image(BEET_STALK);
		
		public var grabbed:Boolean = false;
		private var graphic_list:Graphiclist = new Graphiclist();
		private var timer:int = 20;
		private var happiness:int = 3;
		
		public function Beet(x:int, y:int) 
		{
			super(x, y);
			set_up_graphic_list();
			type = "Beet";
			setHitbox(56 * 84);
		}
		
		public override function update():void
		{
			if (!grabbed)
			{
				if (timer <= 0)
				{
					timer = 50;
					if (happiness > -5)
					{
						happiness--;			
					}
					
					if(happiness<0)
					{
						beet_body_outline.y -= happiness;
						beet_body_color.y -= happiness;
						beet_expression.y -= happiness;
					}
				}
				
				else
				{

					timer--;
				}
				
				beet_expression.setFrame(16-(happiness+5));
			}
		}
		
		public function set_up_graphic_list():void 
		{
			graphic_list.removeAll();
			
			beet_body_color.scale = 1.40;
			beet_body_outline.scale = 1.40;
			
			graphic_list.add(beet_body_color);
			graphic_list.add(beet_body_outline);
			
			beet_top_color.scale = 1.40;
			beet_top_outline.scale = 1.40;
			
			graphic_list.add(beet_top_color);
			graphic_list.add(beet_top_outline);
			
			beet_expression.scale = 0.95;
			
			beet_expression.x = 12;
			beet_expression.y = 20;
			
			
			graphic_list.add(beet_expression);
			
			graphic = graphic_list;
			
		}
	}

}