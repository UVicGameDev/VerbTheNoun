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
		public const WALKING:int = 0; 
		public const GRABBING:int = 1; 
		public const HOLDING:int = 2;
		public const SNUGGLING:int = 3; 
	
		[Embed(source = 'HTB_assets/Player_strip9.png')] private const PLAYER_ANIMATION:Class;
		private var playerSprite:Spritemap = new Spritemap(PLAYER_ANIMATION, 40,80);
		
		private var state:int = HOLDING;
		private var keep_snuggling:Boolean;
		private var target:Beet = null;
		private var pull_frame_index:int = -1;
		private var drop_frame_index:int = -1;
		private var holding_beet:Boolean = false;
		
		
		public override function Player(x:int, y:int) 
		{
			add_animations();
			super(x, y);
			playerSprite.play("stand_still");
			graphic = playerSprite;
			setHitbox(40,80);
		}
		
		public function add_animations():void
		{
			playerSprite.add("walk", [0,1,2],24,true);
			playerSprite.add("squat", [1,6,7,8],12,false);
			playerSprite.add("stand_up", [8,7,6,1],12,false);
			playerSprite.add("snuggle", [4,3,4,5],15, false);
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
						pull_frame_index = playerSprite.index-1;
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
			
						//add if gholding beet, put beet down before dropping
					if (target == null)
					{
						if (Input.pressed(Key.LEFT)&& x>0)
						{
							playerSprite.play("walk");
							state = WALKING;
							x_step += -4;
						}
						if (Input.pressed(Key.RIGHT) && x<560)
						{
							playerSprite.play("walk");
							state = WALKING;
							x_step += 4;
						}
						if (Input.pressed(Key.Z))
						{
							target = collide("Beet", x, y) as Beet;
							if (target)
							{
								//switch animation
								//zap to beet position
								x = target.x + 8;
								playerSprite.play("squat");
								state = GRABBING;
								
							}
							//break;
						}
					}
					else 
					{
						if (holding_beet)
						{
							if (Input.pressed(Key.X))
							{
								playerSprite.play("snuggle");
								target.snuggle();
								state = SNUGGLING;
							}
							if (Input.pressed(Key.LEFT)&& x>0)
							{
								playerSprite.play("squat");
								drop_frame_index = -1;
								holding_beet = false;
								state = WALKING;
							}
							if (Input.pressed(Key.RIGHT) && x<560)
							{
								playerSprite.play("squat");
								drop_frame_index = -1;
								holding_beet = false;
								state = WALKING;
							}
						}
						else
						{
							if (playerSprite.index>pull_frame_index)
							{
								pull_frame_index = playerSprite.index;
								if (target.stalk_list.length > 0)
								{
									target.pull_stalk();
								}
							}
							
							if (pull_frame_index>=3)
							{
								if (target.remove_stalk())
								{
									target.show_hands = false;
									target.update_graphic_list();
									target = null;
								}
								else 
								{
									holding_beet = true;
									target.grabbed = true;
									//target.show_hands = true;
									//target.update_graphic_list();
								}
							}
						}
						
					}
					//if(playerSprite.currentAnim == "stand_up" && playerSprite.currentAnim == )
					break;
					
				case SNUGGLING:
					//if snuggle animation complete at last
					//go to normal
					if (playerSprite.complete && playerSprite.currentAnim == "snuggle")
					{
						if (keep_snuggling)
						{
							target.snuggle();
							playerSprite.setFrame(0)
							playerSprite.play("snuggle");
							keep_snuggling = false;
						}
						else 
						{
							state = HOLDING;
							playerSprite.play("stand_still");
						}
					}
					if (Input.pressed(Key.X))
					{
						keep_snuggling = true;
					}
					break;
					
				case WALKING:
					if (target == null)
					{
						var x_step:int = 0;
						//check keys
						if (Input.check(Key.LEFT)&& x>0)
						{
							x_step += -3;
						}
						if (Input.check(Key.RIGHT)&& x<560)
						{
							x_step += 3;
						}
						
						if (Input.pressed(Key.Z))
						{
							target = collide("Beet", x, y) as Beet;
							if (target)
							{
								//switch animation
								//zap to beet position
								x = target.x + 8;
								playerSprite.play("squat");
								state = GRABBING;
							}
							break;
						}
						if (x_step == 0)
						{
							playerSprite.play("stand_still");
						}
						else if (playerSprite.currentAnim=="stand_still") {
							playerSprite.play("walk");
						}
						x += x_step;
					}
					else
					{
						if (playerSprite.index>drop_frame_index)
						{
							drop_frame_index = playerSprite.index;
							target.drop_beet();
						}
						
						if (drop_frame_index>=3)
						{
							if (target != null)
							{
								target.grabbed = false;
								target.show_hands = false;
								target.update_graphic_list();
								target = null;
							}
							else
							{
								if (Input.pressed(Key.LEFT)&& x>0)
								{
									playerSprite.play("walk");
									
								}
								if (Input.pressed(Key.RIGHT) && x<560)
								{
									playerSprite.play("walk");
									
								}
							}
						}
					
						
					}
					break;
			}
		}
		
	}

}