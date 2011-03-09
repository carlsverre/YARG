package yarg
{
  import com.carlsverre.yagf.Game;
  import com.carlsverre.yagf.Key;
  import com.carlsverre.yagf.KeyManager;
  import com.carlsverre.yagf.SimpleTF;
  import com.carlsverre.yagf.YAGF;
  import com.coreyoneil.collision.CollisionList;

  public class RunningGame extends Game
  {
    private var runner:Runner;
    private var level:Level;
    private var collisionList:CollisionList;
    
  	public override function Setup():void {
  	  KeyManager.AddKeyBinding( {
  	    "jump":Key.UP,
  			"left":Key.LEFT,
  			"right":Key.RIGHT
  		});
		
      // Create the level
      level = new Level();
      addChild(level);
      level.Reset(40, 80, 0xcccccc);
        
      // Create the runner
  		runner = new Runner();
  		addChild(runner);
  		runner.Reset(50, stage.stageHeight - 100, 20, 20, 15, 15, 0, 10);
      
      collisionList = new CollisionList(runner, level);
      collisionList.returnAngle = true;
  	}
  	
  	public override function Shutdown():void {
    	KeyManager.RemoveAllKeyBindings();
  	}
	
	  public override function Update(delta:Number):void {
      level.Update(delta);
	    runner.Update(delta);
      
      var collisions:Array = collisionList.checkCollisions();
      if (collisions.length > 0) {
        runner.CollideWith(collisions[0]);
      }
	  }
	  
	  public override function Draw():void {
      level.Draw();
	    runner.Draw();
	  }
  }

}

