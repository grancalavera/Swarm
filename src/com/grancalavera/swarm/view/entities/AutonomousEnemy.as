package com.grancalavera.swarm.view.entities
{
import net.flashpunk.FP;

public class AutonomousEnemy extends Enemy
{
    public function AutonomousEnemy(x:Number=0, y:Number=0)
    {
        super(x, y);
        changeDirAtRandom();
    }
    
    private var speedX:uint = 5;
    private var speedY:uint = 5;
    
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
            changeDirAtRandom();
        }    
        
        var xSpeed:int = speedX * directionX;
        var ySpeed:int = speedY * directionY;
        
        var xTo:int = (x + xSpeed) % FP.width;
        var yTo:int = (y + ySpeed) % FP.height;
         
        x = xTo < 0 ? FP.width + xTo : xTo;
        y = yTo < 0 ? FP.height + yTo : yTo;

    }
    
    private function changeDirAtRandom():void
    {
        directionX = getRandomDirection();
        directionY = getRandomDirection();        
    }
    
    private function getRandomDirection():int
    {
        return flipACoin() ? 1 : -1;
    }
    
    private function flipACoin():Boolean
    {
        return 0.5 < Math.random() ? true : false;
    }
}
}