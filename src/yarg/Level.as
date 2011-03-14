package yarg
{
  import com.carlsverre.yagf.Key;
  import com.carlsverre.yagf.KeyManager;
  import flash.display.Graphics;
  import flash.display.Sprite;
  import flash.geom.Rectangle;

  public class Level extends Sprite
  {
    private static const MAX_BUILDINGS:int = 10;
    
    // baseline defines how many pixels above the bottom
    // of the screen the "median" building height should be
    private static const BASELINE:int = 50;
    
    // MAX_HEIGHT is the amount of pixels from the top of
    // the screen the max building height should be
    private static const MAX_HEIGHT:int = 100;
    
    // MIN_HEIGHT is the amount of pixels from the bottom
    // of the screen the minimum building height should be
    private static const MIN_HEIGHT:int = 20;
    
    private static const MIN_WIDTH:int = 100;
    private static const MAX_WIDTH:int = 400;
    
    // maximum distance between buildings
    private static const MAX_SPACE:int = 200;
    
    // the maximum different between two building heights
    private static const MAX_HEIGHT_DIFF:int = 100;
    
    private var buildings:Array;
    private var speed:Number;
    private var maxSpeed:Number;
    private var buildingColor:uint;
      
    public function Reset(movementSpeed:Number, maxMovementSpeed:Number, color:uint):void {
      buildings = [];
      speed = movementSpeed;
      maxSpeed = maxMovementSpeed;
      buildingColor = color;
      
      // add first building
      buildings.push(new Rectangle(0, stage.stageHeight - BASELINE, MAX_WIDTH, BASELINE));
      
      updateBuildingsArray();
    }
    
    // every time you call this, it will make sure that the
    // far left building is visible, and make sure we have enough
    // buildings in the array
    private function updateBuildingsArray():void {
      // delete left building if it has left the screen
      if(buildings.length > 0) {
        var leftBuilding:Rectangle = buildings[0];
        if (leftBuilding.right < 0)
          buildings.shift();
      }
      
      // make sure the buildings array is full
      while(buildings.length < MAX_BUILDINGS) {
        var lastBuilding:Rectangle = buildings[buildings.length - 1];
        
        var newX:Number = lastBuilding.right + (Math.random() * MAX_SPACE);
        
        var maybeNeg:int = (Math.random() > .5) ? -1 : 1;
        var newY:Number = lastBuilding.top + (maybeNeg * (Math.random() * MAX_HEIGHT_DIFF));
        if (newY < MAX_HEIGHT) newY = MAX_HEIGHT;
        if (newY > stage.stageHeight - MIN_HEIGHT) newY = stage.stageHeight - MIN_HEIGHT;
        
        var newWidth:int = MIN_WIDTH + (Math.random() * MAX_WIDTH);
        var newHeight:int = stage.stageHeight - newY;
        
        var newBuilding:Rectangle = new Rectangle(newX, newY, newWidth, newHeight);
        buildings.push(newBuilding);
      }
    }
    
    private function updateBuildings(delta:Number):void {
      for each(var building:Rectangle in buildings) {
        building.x -= speed * delta;
      }
    }
    
    private function drawBuildings():void {
      var g:Graphics = graphics;
      g.clear();
      g.beginFill(buildingColor);
      
      for each(var building:Rectangle in buildings) {
        if (building.right < 0 || building.left > stage.stageWidth) continue;
        g.drawRect(building.x, building.y, building.width, building.height);
      }
      
      g.endFill();
    }
      
    public function Update(delta:Number):void {
      updateBuildingsArray();
      updateBuildings(delta);
      
      if (speed < maxSpeed) speed++;
    }
      
    public function Draw():void {
      drawBuildings();
    }
  }

}

