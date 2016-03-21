package
{
	import flash.display.MovieClip;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Bitmap;

	public class Player_MC extends MovieClip
	{
		public function Player_MC()
		{
		}
		function pixelHitTest(mc:MovieClip,alphaThreshold:Number)
		{
			alphaThreshold = alphaThreshold ? alphaThreshold : 1;
			
			var thisBitmap:BitmapData = new BitmapData(this.width, this.height, true, 0);
			thisBitmap.draw(this);
			
			var mcBitmap:BitmapData = new BitmapData(mc.width, mc.height, true, 0);
			mcBitmap.draw(mc);
			
			//threshold highest alpha value to be considedred as opque for collision check
			if (thisBitmap.hitTest(new Point(this.x, this.y), //starting position of first obj
								   alphaThreshold, //threshold for first obj
								   mcBitmap,  //second object for collision check
								   new Point(mc.x, mc.y), //starting position of second obj
								   alphaThreshold))// threshold for second obj
			{
				return true;
			}
			return false;
			
		}		
	}
}