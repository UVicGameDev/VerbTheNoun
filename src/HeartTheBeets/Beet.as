package HeartTheBeets 
{
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Beet extends HeartTheBeetsEntity
	{
		[Embed(source = 'HTB_assets/BeetColor.png')] private const BEET_BODY_COLOR:Class;
		[Embed(source = 'HTB_assets/BeetTopColor.png')] private const BEET_TOP_COLOR:Class;
		[Embed(source = 'HTB_assets/BeetOutline.png')] private const BEET_BODY_OUTLINE:Class;
		[Embed(source = 'HTB_assets/BeetTopOutline.png')] private const BEET_TOP_OUTLINE:Class;
		[Embed(source = 'HTB_assets/BeetExpression_strip17.png')] private const BEET_EXPRESSION:Class;
		[Embed(source = 'HTB_assets/PlayerHands_strip2.png')] private const HANDS:Class;
		
		private var beet_body_color:Image = new Image(BEET_BODY_COLOR);
		private var beet_top_color:Image = new Image(BEET_TOP_COLOR);
		private var beet_body_outline:Image = new Image(BEET_BODY_OUTLINE);
		private var beet_top_outline:Image = new Image(BEET_TOP_OUTLINE);
		private var beet_expression:Spritemap = new Spritemap(BEET_EXPRESSION, 32, 32);
		private var hands:Spritemap = new Spritemap(HANDS, 40, 80);
		
		public var grabbed:Boolean = false;
		public var show_hands:Boolean = false;
		private var graphic_list:Graphiclist = new Graphiclist();
		private var timer:int = 100;
		public var happiness:int = 3;
		//public var held:Boolean = false;
		//private var stalk_length:int = 0;
		public var stalk_list:Array = new Array();
		
		public function Beet(x:int, y:int) 
		{
			super(x, y);
			initialize_graphic_list();
			type = "Beet";
			setHitbox(56 * 84);
		}
		
		public override function update():void
		{
			if (!grabbed)
			{
				if (timer <= 0)
				{
					timer = 100;
					if (happiness > -5)
					{
						happiness--;			
					}
					
					if(happiness<0 && beet_body_outline.y<240)
					{
						beet_body_outline.y -= happiness;
						beet_body_color.y -= happiness;
						beet_expression.y -= happiness;
						
						if ((((Number)(beet_body_outline.y))+15.0)/ 22.0 > stalk_list.length)
						{
							stalk_list.unshift(new Stalk(x+24, stalk_list.length * 22 + 5))
							//stalk_length++list,
							update_graphic_list();
						}
					}
				}
				
				else
				{
					timer--;
				}
				
				beet_expression.setFrame(16-(happiness+5));
			}
		}
		
		public function initialize_graphic_list():void 
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
			
			hands.x += 8;
			
			graphic_list.add(beet_expression);
			
			graphic = graphic_list;
		}
		
		public function update_graphic_list():void
		{
			graphic_list.removeAll();
			
			for (var i:int; i < stalk_list.length; i++)
			{
				graphic_list.add(((Stalk)(stalk_list[i])).get_image());
			}
			
			graphic_list.add(beet_body_color);
			graphic_list.add(beet_body_outline);
			
			graphic_list.add(beet_top_color);
			graphic_list.add(beet_top_outline);
			
			graphic_list.add(beet_expression);
			
			if (show_hands)
			{
				hands.y = beet_top_outline.y - 10;
				graphic_list.add(hands);
			}
			graphic = graphic_list;
		}
		
		public function pull_stalk()
		{
			for (var i:int; i < stalk_list.length; i++)
			{
				((Stalk)(stalk_list[i])).y-=5.5;
			}
			if (stalk_list.length > 1)
			{
				beet_body_color.y -= 5.5;
				beet_body_outline.y -= 5.5;
				beet_top_color.y -= 5.5;
				beet_top_outline.y -= 5.5;
				beet_expression.y -= 5.5;
			}
			else 
			{
				show_hands = true;
				beet_body_color.y -= 9.5;
				beet_body_outline.y -= 9.5;
				beet_top_color.y -= 9.5;
				beet_top_outline.y -= 9.5;
				beet_expression.y -= 9.5;
			}
			update_graphic_list();
		}
		
		public function remove_stalk():Boolean
		{
			var result:Boolean = false;
			trace("length = "+stalk_list.length);
			if (stalk_list.length > 1)
			{
				trace("length = "+stalk_list.length);
				stalk_list.pop();
				beet_top_color.y = 0;
				beet_top_outline.y = 0;
				result = true;
			}
			else 
			{
				beet_top_color.y = -30;
				beet_top_outline.y = -30;
				beet_body_color.y = -30;
				beet_body_outline.y = -30;
				beet_expression.y = -10;
				stalk_list.pop();
			}
			update_graphic_list();
			return result;
		}
		
		public function snuggle()
		{
			if (happiness < 11)
			{
				happiness++;
			}
			beet_expression.setFrame(16-(happiness+5));
			update_graphic_list();
		}
		
		public function drop_beet()
		{
			beet_body_color.y += 9.5;
			beet_body_outline.y += 9.5;
			beet_top_color.y += 9.5;
			beet_top_outline.y += 9.5;
			beet_expression.y += 9.5;
			update_graphic_list();
		}
		
		public function get_rained_on()
		{
			if (beet_body_outline.y < 20)
			{
				happiness -= 2;
				if (happiness < -5)
					happiness = -5;
				(FP.world as HeartTheBeetsWorld).points += 5;
			}
		}
	}

}