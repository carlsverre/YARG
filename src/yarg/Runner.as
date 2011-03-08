package yarg
{
  import flash.display.MovieClip;
  import com.carlsverre.yagf.KeyManager;

public class Runner extends MovieClip
{
  private Array states = ["idle", "running"];
  private String state = states[0];
  
  // Physics
  private var acceleration:Point;
  private var velocity:Point;
  private var maxVelocity:Point;
  private var position:Point;
  private var lastPosition:Point;
	
	public function Runner()
	{
	  
	}
	
	public function Reset(x:int, y:int, accelX:int, accelY:int, maxVelX:int, maxVelY:int):void {
	  position = new Point(x,y);
	  lastPosition = new Point(x,y);
	  
	  acceleration = new Point(accelX, accelY);
	  velocity = new Point(0,0);
	  maxVelocity = new Point(maxVelX, maxVelY);
	}
	
	public function Update(delta:Number):void {
	  if(KeyManager.ActionPressed("right")) {
	    velocity += acceleration.x * ;
	  }
	  if(KeyManager.ActionPressed("left")) {
	    velocity -= acceleration.x;
	  }
	  
	  
	}
	
	public function Draw():void {
	  x = position.x;
	  y = position.y;
	}
	
}

}

