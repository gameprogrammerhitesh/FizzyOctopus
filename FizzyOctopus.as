   /* Fizzy Octopus - Game For Clash Flash Website   
     Game Name: Fizzy-Octopus
    -----------------------------------------------------------
    Programming and Designed by Hitesh Sathawane                                 
    COPYRIGHT ©2015 by Hitesh Sathawane  
	Email:hiteshsathawane@live.com            
    Website:http://hiteshsathawane.webs.com											
    All rights reserved.                                                     
   -----------------------------------------------------------*/
package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.system.fscommand;
	public class FizzyOctopus extends MovieClip
	{
		
		var score1:int=0;            //Score Variable
		var backSound:BackSound;     //Background Sound
		
		//Level 1
		var vx:int=15;               //speed of the enemy        (Level 1)
		var bx:int=10;               //speed of the enemy 1      (Level 1)
		var vy:int=7.5;              //speed of the enemy 2      (Level 1)
		var by:int=5;                //speed of the enemy 3      (Level 1)
		var bn:int=5;                //speed of the enemy 4      (Level 1)
		
		
		//Level 2
		var lvx:int=16;              //speed of the enemy         (Level 2)
		var lbx:int=11;              //speed of the enemy 1       (Level 2)
		var lvy:int=8.5;             //speed of the enemy 2       (Level 2)
		var lby:int=6;               //speed of the enemy 3       (Level 2)
		var lbn:int=6;               //speed of the enemy 4       (Level 2)
		
		//Level 3
		var llvx:int=11;            //speed of the enemy         (Level 3)
		var llbx:int=10;            //speed of the enemy 1       (Level 3)
	    var llvy:int=10;            //speed of the enemy 2       (Level 3)
		var llby:int=11.5;          //speed of the enemy 3       (Level 3)
		var llbn:int=7;             //speed of the enemy 4       (Level 3)
		
		
		var frameOne:Boolean=false;    //switch to code MainMenu.
		var frameTwo:Boolean=false;    //switch to code Level 1.
		var frameThree:Boolean=false;  //switch to code Level 2.
		var frameFour:Boolean=false;   //switch to code Level 3.
		var frameFive:Boolean=false;   //switch to code Retry.
		var frameSix:Boolean=false;    //switch to Game End Screen
		
		var leftKey:Boolean=false;      //Player Movement
		var rightKey:Boolean=false;     //Player Movement
		var upKey:Boolean=false;        //Player Movement
		var downKey:Boolean=false;      //Player Movement
		
		public function FizzyOctopus()
		{   	


			
			// Background Sound
			backSound = new BackSound();
			var soundChannel:SoundChannel= backSound.play();
			var transform:SoundTransform= new SoundTransform();
			soundChannel.soundTransform  = transform;
			
			stage.addEventListener(Event.ENTER_FRAME,update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,isKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,isKeyUp);
			
			//Code for the Main Menu Play Button
			play_btn.addEventListener(MouseEvent.CLICK,isPlay);
			//Code for the Main Menu Exit Button
			exit_btn.addEventListener(MouseEvent.CLICK,isExit);
			//Code for the Main Menu Instruction Button
			instruction_btn.addEventListener(MouseEvent.CLICK,isInstruction);
			
			retry_btn.addEventListener(MouseEvent.CLICK,isRetry);
			
			
		}
		public function update(e:Event)
		{
			//Level l Code
			
			if(frameTwo)
			{       //Level 1 Bitmap Collision Logic
			       if(player_mc!=null)
				{
					if(player_mc.pixelHitTest(enemy_mc,1))
					{
						player_mc.visible=false;
						retry_btn.addEventListener(MouseEvent.CLICK,isRetry);
						gotoAndStop(5);
						frameTwo=false;
						frameFive=true;
					}
				
					if(player_mc.pixelHitTest(enemy1_mc,1))
					{
						player_mc.visible=false;
					}
					
					if(player_mc.pixelHitTest(enemy2_mc,1))
					{
						player_mc.visible=false;
					}
					
					if(player_mc.pixelHitTest(enemy3_mc,1))
					{
						player_mc.visible=false;
					}
					
					if(player_mc.pixelHitTest(enemy4_mc,1))
					{
						player_mc.visible=false;
						player_mc.x=-500;
						//retry_btn.addEventListener(MouseEvent.CLICK,isRetry);
						gotoAndStop(6);
						frameTwo=true;
						frameFive=false;
						
					}
				
				//Level 1 Enemy Movement Code 
				enemy_mc.x=enemy_mc.x+vx;
				if(enemy_mc.x >= stage.stageWidth-enemy_mc.width)
				{
					enemy_mc.x=stage.stageWidth-enemy_mc.width;
					vx *= -1;
				}
				
				if(enemy_mc.x <= 0)
				{
					enemy_mc.x=0;
					vx *=-1;
				}
				
				//Level 1 Enemy1 Movement Code 
				enemy1_mc.x=enemy1_mc.x+bx;
				if(enemy1_mc.x >= stage.stageWidth-enemy1_mc.width)
				{
					enemy1_mc.x=stage.stageWidth-enemy1_mc.width;
					bx *= -1;
				}
				
				if(enemy1_mc.x <= 0)
				{
					enemy1_mc.x=0;
					bx *=-1;
				}
				
				//Level 1 Enemy 2 Movement Code 
				enemy2_mc.x=enemy2_mc.x+vy;
				if(enemy2_mc.x >= stage.stageWidth-enemy2_mc.width)
				{
					enemy2_mc.x=stage.stageWidth-enemy2_mc.width;
					vy *= -1;
				}
				
				if(enemy2_mc.x <= 0)
				{
					enemy2_mc.x=0;
					vy *=-1;
				}
				
				//Level 1 Enemy 3 Movement Code 
				enemy3_mc.x=enemy3_mc.x+by;
				if(enemy3_mc.x >= stage.stageWidth-enemy3_mc.width)
				{
					enemy3_mc.x=stage.stageWidth-enemy3_mc.width;
					by *= -1;
				}
				
				if(enemy3_mc.x <= 0)
				{
					enemy3_mc.x=0;
					by *=-1;
				}
				
				//Level 1 Enemy 4 Movement Code 
				enemy4_mc.x=enemy4_mc.x+bn;
				if(enemy4_mc.x >= stage.stageWidth-enemy4_mc.width)
				{
					enemy4_mc.x=stage.stageWidth-enemy4_mc.width;
					bn *= -1;
				}
				
				if(enemy4_mc.x <= 0)
				{
					enemy4_mc.x=0;
					bn *=-1;
				}
				
				//Level 1 Player Movement Speed
				
				if(leftKey)
					{
						player_mc.x=player_mc.x-5;
					}
				if(rightKey)
					{
						player_mc.x=player_mc.x+5;
					}
				if(upKey)
					{
						player_mc.y=player_mc.y-5;
					}
				if(downKey)
					{
						player_mc.y=player_mc.y+5;
					}
					
			    //Level 1 Player Boundary
			    if(player_mc.x <= 0)
					{
						player_mc.x = 0;
					}
					if(player_mc.x >=stage.stageWidth-player_mc.width)
					{
						player_mc.x = stage.stageWidth-player_mc.width;
					}
					if(player_mc.y >=stage.stageHeight-player_mc.height)
					{
						player_mc.y = stage.stageHeight-player_mc.height;
					}
					
				//Level 1 Score Code	
				if(player_mc.hitTestObject(shell5_mc))
			        {
				        shell5_mc.visible=false;
						shell5_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(player_mc.hitTestObject(shell4_mc))
			        {
				        shell4_mc.visible=false;
						shell4_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(player_mc.hitTestObject(shell3_mc))
			        {
				        shell3_mc.visible=false;
						shell3_mc.x=-300;
				        score1 = score1 + 10;
			        }
			    if(player_mc.hitTestObject(shell2_mc))
			        {
				        shell2_mc.visible=false;
						shell2_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(player_mc.hitTestObject(shell1_mc))
			        {
				        shell1_mc.visible=false;
						shell1_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(player_mc.hitTestObject(shell_mc))
			        {
				        shell_mc.visible=false;
						shell_mc.x=-300;
				        score1 = score1 + 10;
			        }
					
					
					score_txt.text = "Pearls:-" + score1; 
					
					// Goto Next Level Code
					
					if(player_mc.y < player_mc.height-130)
					{
						gotoAndStop(3);
						frameTwo=false;
						frameThree=true;
						this.stage.focus=this.stage;
					}
					
				
			}
		}
			
			if(frameThree)
			{
					// Level 2 Enemy Rotation Code	
				    lenemy_mc.rotation=lenemy_mc.rotation+lbx;
				    lenemy1_mc.rotation=lenemy1_mc.rotation+lbx;
				    lenemy2_mc.rotation=lenemy2_mc.rotation+lbx;
		            lenemy3_mc.rotation=lenemy3_mc.rotation+lbx;
				    lenemy4_mc.rotation=lenemy4_mc.rotation+lbx;
			 
			      
				  // Level 2 Bitmap Collision Logic
			      if(lplayer_mc.pixelHitTest(lenemy_mc,1))
				{
					lplayer_mc.visible=false;
				}
				
				if(lplayer_mc.pixelHitTest(lenemy1_mc,1))
				{
					lplayer_mc.visible=false;
				}
				
				if(lplayer_mc.pixelHitTest(lenemy2_mc,1))
				{
					lplayer_mc.visible=false;
				}
				
				if(lplayer_mc.pixelHitTest(lenemy3_mc,1))
				{
					lplayer_mc.visible=false;
				}
				if(lplayer_mc.pixelHitTest(lenemy4_mc,1))
				{
					lplayer_mc.visible=false;
				}
			
			 //Level 2 Enemy Movement Code + Enemy Boundary Code 
			
			lenemy_mc.x=lenemy_mc.x+lvx;
			if(lenemy_mc.x >= stage.stageWidth-lenemy_mc.width/2)
			{
				lenemy_mc.x=stage.stageWidth-lenemy_mc.width/2;
				lvx *= -1;
			}
			if(lenemy_mc.x <= lenemy_mc.width/2)
			{
				lenemy_mc.x=lenemy_mc.width/2;
				lvx *=-1;
			}
			
			//Level 2 Enemy 1 Movement Code + Enemy 1 Boundary Code  
			
			lenemy1_mc.x=lenemy1_mc.x+lbx;
			if(lenemy1_mc.x >= stage.stageWidth-lenemy1_mc.width/2)
			{
				lenemy1_mc.x=stage.stageWidth-lenemy1_mc.width/2;
				lbx *= -1;
			}
			if(lenemy1_mc.x <=lenemy1_mc.width/2)
			{
				lenemy1_mc.x=lenemy1_mc.width/2;
				lbx *=-1;
			}
			//Level 2 Enemy 2 Movement Code + Enemy 2 Boundary Code 
			
			lenemy2_mc.x=lenemy2_mc.x+lvy;
			if(lenemy2_mc.x >= stage.stageWidth-lenemy2_mc.width/2)
			{
				lenemy2_mc.x=stage.stageWidth-lenemy2_mc.width/2;
				lvy *= -1;
			}
			if(lenemy2_mc.x <= lenemy2_mc.width/2)
			{
				lenemy2_mc.x=lenemy2_mc.width/2;
				lvy *=-1;
			}
			 //Level 2 Enemy 3 Movement Code + Enemy 3 Boundary Code 
			
			lenemy3_mc.x=lenemy3_mc.x+lby;
			if(lenemy3_mc.x >= stage.stageWidth-lenemy3_mc.width/2)
			{
				lenemy3_mc.x=stage.stageWidth-lenemy3_mc.width/2;
				lby *= -1;
			}
			if(lenemy3_mc.x <= lenemy3_mc.width/2)
			{
				lenemy3_mc.x=lenemy3_mc.width/2;
				lby *=-1;
			}
			//Level 2 Enemy 4 Movement Code + Enemy 4 Boundary Code 
			
			lenemy4_mc.x=lenemy4_mc.x+lbn;
			if(lenemy4_mc.x >= stage.stageWidth-lenemy4_mc.width/2)
			{
				lenemy4_mc.x=stage.stageWidth-lenemy4_mc.width/2;
				lbn *= -1;
			}
			if(lenemy4_mc.x <= lenemy4_mc.width/2)
			{
				lenemy4_mc.x=lenemy4_mc.width/2;
				lbn *=-1;
			}
			
			//Level 2 Player Movement
			
			if(leftKey)
				{
					lplayer_mc.x=lplayer_mc.x-5;
				}
			if(rightKey)
				{
					lplayer_mc.x=lplayer_mc.x+5;
				}
			if(upKey)
				{
					lplayer_mc.y=lplayer_mc.y-5;
				}
			if(downKey)
				{
					lplayer_mc.y=lplayer_mc.y+5;
				}
				//level 2 Player Boundary
				
				if(lplayer_mc.x <= 0)
				{
					lplayer_mc.x = 0;
				}
				if(lplayer_mc.x >=stage.stageWidth-lplayer_mc.width)
				{
					lplayer_mc.x = stage.stageWidth-lplayer_mc.width;
				}
				if(lplayer_mc.y >=stage.stageHeight-lplayer_mc.height)
				{
					lplayer_mc.y = stage.stageHeight-lplayer_mc.height;
				}
				//Level 2 Score Code	
				
				if(lplayer_mc.hitTestObject(lshell5_mc))
			        {
				        lshell5_mc.visible=false;
						lshell5_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(lplayer_mc.hitTestObject(lshell4_mc))
			        {
				        lshell4_mc.visible=false;
						lshell4_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(lplayer_mc.hitTestObject(lshell3_mc))
			        {
				        lshell3_mc.visible=false;
						lshell3_mc.x=-300;
				        score1 = score1 + 10;
			        }
			    if(lplayer_mc.hitTestObject(lshell2_mc))
			        {
				        lshell2_mc.visible=false;
						lshell2_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(lplayer_mc.hitTestObject(lshell1_mc))
			        {
				        lshell1_mc.visible=false;
						lshell1_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(lplayer_mc.hitTestObject(lshell_mc))
			        {
				        lshell_mc.visible=false;
						lshell_mc.x=-300;
				        score1 = score1 + 10;
			        }
					
					
					score1_txt.text = "Pearls:-" + score1; 
					
					// Goto Next Level Code
					
				if(lplayer_mc.y < lplayer_mc.height-130)
					{
						gotoAndStop(4);
						frameThree=false;
						frameFour=true;
						this.stage.focus=this.stage;
					}
					
			}
		
		     if(frameFour)
		  {
			 //Level 3 Bitmap Collision Logic
			
				if(llplayer_mc.pixelHitTest(llenemy_mc,1))
				{
					
					llplayer_mc.visible=false;
				}
				
				if(llplayer_mc.pixelHitTest(llenemy1_mc,1))
				{
					
					llplayer_mc.visible=false;
				}
				
			
				if(llplayer_mc.pixelHitTest(llenemy2_mc,1))
				{
					
					llplayer_mc.visible=false;
				}
				if(llplayer_mc.pixelHitTest(llenemy3_mc,1))
				{
					
					llplayer_mc.visible=false;
				}
				
				
			
			//Level 3 Enemy Movement Code + Enemy Boundary Code 
			
			llenemy_mc.x=llenemy_mc.x+llvx;
			if(llenemy_mc.x >= stage.stageWidth-llenemy_mc.width)
			{
				llenemy_mc.x=stage.stageWidth-llenemy_mc.width;
				llvx *= -1;
				llenemy_mc.scaleX=-1  // Flipping 
			}
			if(llenemy_mc.x <= llenemy_mc.width)
			{
				llenemy_mc.x=llenemy_mc.width;
				llvx *=-1;
				llenemy_mc.scaleX=1  //Flipping
			}
			
			//Level 3 Enemy 1 Movement Code + Enemy 1 Boundary Code  
			
			llenemy1_mc.x=llenemy1_mc.x+llbx;
			if(llenemy1_mc.x >= stage.stageWidth-llenemy1_mc.width)
			{
				llenemy1_mc.x=stage.stageWidth-llenemy1_mc.width;
				llbx *= -1;
				llenemy1_mc.scaleX=-1  // Flipping 
			}
			if(llenemy1_mc.x <= llenemy1_mc.width)
			{
				llenemy1_mc.x=llenemy1_mc.width;
				llbx *=-1;
				llenemy1_mc.scaleX=1  // Flipping 
			}
			
			//Level 3 Enemy 2 Movement Code + Enemy 2 Boundary Code 
			
			llenemy2_mc.x=llenemy2_mc.x+llvy;
			if(llenemy2_mc.x >= stage.stageWidth-llenemy2_mc.width)
			{
				llenemy2_mc.x=stage.stageWidth-llenemy2_mc.width;
				llvy *= -1;
				llenemy2_mc.scaleX=-1  // Flipping 
			}
			if(llenemy2_mc.x <= llenemy2_mc.width)
			{
				llenemy2_mc.x=llenemy2_mc.width;
				llvy *=-1;
				llenemy2_mc.scaleX=1  // Flipping 
			}
			
			//Level 3 Enemy3 Movement Code + Enemy 3 Boundary Code 
			
			llenemy3_mc.x=llenemy3_mc.x+llby;
			if(llenemy3_mc.x >= stage.stageWidth-llenemy3_mc.width)
			{
				llenemy3_mc.x=stage.stageWidth-llenemy3_mc.width;
				llby *= -1;
				llenemy3_mc.scaleX=-1  // Flipping 
			}
			if(llenemy3_mc.x <= llenemy3_mc.width)
			{
				llenemy3_mc.x=llenemy3_mc.width;
				llby *=-1;
				llenemy3_mc.scaleX=1  // Flipping 
			}
			//Level 3 Enemy4 Movement Code + Enemy 4 Boundary Code 
			/*
			enemy4_mc.x=enemy4_mc.x+bn;
			if(enemy4_mc.x >= stage.stageWidth-enemy4_mc.width)
			{
				enemy4_mc.x=stage.stageWidth-enemy4_mc.width;
				bn *= -1;
			}
			if(enemy4_mc.x <= enemy4_mc.width)
			{
				enemy4_mc.x=enemy4_mc.width;
				bn *=-1;
			}*/
			
			//Level 3 Score Code	
			
			if(llplayer_mc.hitTestObject(llshell5_mc))
			        {
				        llshell5_mc.visible=false;
						llshell5_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(llplayer_mc.hitTestObject(llshell4_mc))
			        {
				        llshell4_mc.visible=false;
						llshell4_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(llplayer_mc.hitTestObject(llshell3_mc))
			        {
				        llshell3_mc.visible=false;
						llshell3_mc.x=-300;
				        score1 = score1 + 10;
			        }
			    if(llplayer_mc.hitTestObject(llshell2_mc))
			        {
				        llshell2_mc.visible=false;
						llshell2_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(llplayer_mc.hitTestObject(llshell1_mc))
			        {
				        llshell1_mc.visible=false;
						llshell1_mc.x=-300;
				        score1 = score1 + 10;
			        }
				if(llplayer_mc.hitTestObject(llshell_mc))
			        {
				        llshell_mc.visible=false;
						llshell_mc.x=-300;
				        score1 = score1 + 10;
			        }
					
					
					score2_txt.text = "Pearls:-" + score1; 
			
			
			
			
			//Level 3 Player Movement Speed
			
			if(leftKey)
				{
					llplayer_mc.x=llplayer_mc.x-5;
				}
			if(rightKey)
				{
					llplayer_mc.x=llplayer_mc.x+5;
				}
			if(upKey)
				{
					llplayer_mc.y=llplayer_mc.y-5;
				}
			if(downKey)
				{
					llplayer_mc.y=llplayer_mc.y+5;
				}
				
				//Level 3 Player Boundary
				
				if(llplayer_mc.x <= 0)
				{
					llplayer_mc.x = 0;
				}
				if(llplayer_mc.x >=stage.stageWidth-llplayer_mc.width)
				{
					llplayer_mc.x = stage.stageWidth-llplayer_mc.width;
				}
				if(llplayer_mc.y >=stage.stageHeight-llplayer_mc.height)
				{
					llplayer_mc.y = stage.stageHeight-llplayer_mc.height;
				}
				// Game End Screen
				if(llplayer_mc.y < llplayer_mc.height-130)
					{
						gotoAndStop(7);
						frameFour=false;
						frameSix=true;
						this.stage.focus=this.stage;
					}
				
				
				if(frameSix)
				{
					score2_txt.text = "Collected Pearls:-" + score1;
				}
		  }
		
		}
		
		    //Player Movement
			
			 public function isKeyDown(e:KeyboardEvent)
		{
				if(e.keyCode == Keyboard.RIGHT)
				{
					rightKey=true;
				}
				if(e.keyCode == Keyboard.LEFT)
				{
					leftKey=true;
			    }		
				if(e.keyCode==Keyboard.UP)
				{
					upKey=true;
				}
				if(e.keyCode==Keyboard.DOWN)
				{
					downKey=true;
				}
		}
		
		     //Player Movement Speed
		
			 public function isKeyUp(e:KeyboardEvent)
			{
				
				if(e.keyCode == Keyboard.RIGHT)
				{
					rightKey=false;
				}
				if(e.keyCode == Keyboard.LEFT)
				{
					leftKey=false;			
				}	
				if(e.keyCode==Keyboard.UP)
				{
					upKey=false;
				}
				if(e.keyCode==Keyboard.DOWN)
				{
					downKey=false;
				}
			
	      	}
			public function isPlay(e:MouseEvent)
			{
				gotoAndStop(2);
				frameOne=false;
				frameTwo=true;
				this.stage.focus=this.stage;
			}
			public function isExit(e:MouseEvent)
			{
				fscommand("quit");
			}
			public function isInstruction(e:MouseEvent)
            {
			    gotoAndStop(5);
				play2_btn.addEventListener(MouseEvent.CLICK,isPlay);
			}
			public function isRetry(e:MouseEvent)
             {
				//gotoAndStop(2);
				//frameTwo=true;
				gotoAndStop(1);
				frameOne=true;
				frameFive=false;
				
				this.stage.focus=this.stage;
				
			 }
	
	
	
	}
}