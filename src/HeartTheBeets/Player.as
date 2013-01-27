package HeartTheBeets 
{
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key
	import net.flashpunk.graphics.Graphiclist;
	
	
	
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Player extends HeartTheBeetsEntity
	{
		const WALKING:int = 0; 
		const GRABBING:int = 1; 
		const HOLDING:int = 2;
		const SNUGGLING:int = 3; 
	
		[Embed(source = 'HTB_assets/Player_strip9.png')] private const PLAYER_ANIMATION:Class;
		private var playerSprite:Spritemap = new Spritemap(PLAYER_ANIMATION, 40,80);
		
		private var state:int = HOLDING;
		private var keep_snuggling:Boolean;
		
		
		public override function Player(x:int, y:int) 
		{
			add_animations();
			super(x, y);
			playerSprite.play("stand_still");
			graphic = playerSprite;
		}
		
		public function add_animations()
		{
			playerSprite.add("walk", [0,1,2],8,true);
			playerSprite.add("squat", [1,6,7,8],4,false);
			playerSprite.add("stand_up", [8,7,6,1],4,false);
			playerSprite.add("snuggle", [4,3,4,5],5, false);
			playerSprite.add("stand_still", [1],0,true);
		}
		
		public override function get_graphic_list():Graphiclist
		{
			return new Graphiclist(graphic);
		}
		
		public override function update():void
		{
			switch(state)
			{
				case GRABBING:
					
					if (playerSprite.frame == 8)
					{
						playerSprite.play("stand_up");
						state = HOLDING;
					}
					//if(at end of track)
						//if(stalk)
							//back to normal
						//else
							//state = Holding
						//start standing animation
					break;
					
				case HOLDING:
					//if standing animation complete, just stand.
					//if arrow key drop and move (state = nomal)
						//start standing animation
					//else if snuggle button (x)
						//switch to snuggling
						//apply snuggle effects
					if (Input.pressed(Key.LEFT))
					{
						playerSprite.play("walk");
						state = WALKING;
						x_step += -3;
					}
					if (Input.pressed(Key.RIGHT))
					{
						playerSprite.play("walk");
						state = WALKING;
						x_step += 3;
					}
					
					if (Input.pressed(Key.X))
					{
						playerSprite.play("snuggle");
					}
					
					//if(playerSprite.currentAnim == "stand_up" && playerSprite.currentAnim == )
					break;
					
				case SNUGGLING:
					//if snuggle animation complete at last
					//go to normal
					if (playerSprite.frame == 5 )
					{
						if (keep_snuggling)
						{
							playerSprite.play("snuggle");
							keep_snuggling = false;
						}
						else 
						{
							state = HOLDING;
							playerSprite.play("stand_still");
						}
					}
					else
					{
						if (Input.pressed(Key.X))
						{
							keep_snuggling = true;
						}
					}
					break;
					
				default:
					var x_step:int = 0;
					//check keys
					if (Input.pressed(Key.LEFT))
					{
						x_step += -3;
					}
					if (Input.pressed(Key.RIGHT))
					{
						x_step += 3;
					}
					
					if (Input.pressed(Key.Z))
					{
						//if in range
						//switch animation
						//zap to beet position
						playerSprite.play("squat");
						state = GRABBING;
						break;
					}
					x += x_step;
					break;
			}
		}
		
	}

}