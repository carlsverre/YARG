package yarg
{
  import com.carlsverre.yagf.Game;
  import com.carlsverre.yagf.Key;
  import com.carlsverre.yagf.KeyManager;
  import com.carlsverre.yagf.SimpleTF;
  import com.carlsverre.yagf.YAGF;

  public class RunningGame extends Game
  {
    private var runner:Runner;
	
  	public override function Setup():void {
  	  KeyManager.AddKeyBinding( {
  	    "jump":Key.UP,
  			"left":Key.LEFT,
  			"right":Key.RIGHT
  		});
  	  
  		runner = new Runner();
  		addChild(runner);
  		runner.Reset(50, stage.stageHeight - 50, 20,20, 15,15);
  	}
  	
  	public override function Shutdown():void {
    		KeyManager.RemoveAllKeyBindings();
  	}
	
	  public override function Update(delta:Number):void {
	    runner.Update(delta);
	  }
	  
	  public override function Draw():void {
	    runner.Draw();
	  }
  }

}

