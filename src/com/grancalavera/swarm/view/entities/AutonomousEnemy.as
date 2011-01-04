package com.grancalavera.swarm.view.entities
{
import net.flashpunk.FP;

public class AutonomousEnemy extends Enemy
{
    public function AutonomousEnemy(x:Number=0, y:Number=0)
    {
        super(x, y);
    }
    
    private var speedX:uint = 10;
    private var speedY:uint = 10;
    
    public var directionX:int = 0;
    public var directionY:int = 0;
    
    override public function update():void
    {
        super.update();
    
        if (directionX == 0 && directionY == 0)
            return;

        if (collide(EntityTypes.HERO_BULLET, x, y))
        {
            directionX = -directionX;
            directionY = -directionY;
        }
        
        if (collide(EntityTypes.ENEMY, x, y))
        {
            directionX = flipACoin() ? 1 : -1;
            directionY = flipACoin() ? 1 : -1;
        }    
        
        var xSpeed:int = speedX * directionX;
        var ySpeed:int = speedY * directionY;
        
        var xTo:int = (x + xSpeed) % FP.width;
        var yTo:int = (y + ySpeed) % FP.height;
         
        x = xTo < 0 ? FP.width + xTo : xTo;
        y = yTo < 0 ? FP.height + yTo : yTo;

    }
    
    private function flipACoin():Boolean
    {
        return 0.5 < Math.random() ? true : false;
    }
}
}