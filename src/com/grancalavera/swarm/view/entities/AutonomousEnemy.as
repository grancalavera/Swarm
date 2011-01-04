package com.grancalavera.swarm.view.entities
{
import net.flashpunk.FP;

public class AutonomousEnemy extends Enemy
{
    public function AutonomousEnemy(x:Number=0, y:Number=0)
    {
        super(x, y);
    }
    
    private var speedX:uint = 0;
    private var speedY:uint = 2;
    private var directionX:int = 1;
    private var directionY:int = 1;
    
    override public function update():void
    {
        super.update();
    
        var xSpeed:int = speedX * directionX;
        var ySpeed:int = speedY * directionY;
        
        var xTo:int = (x + xSpeed) % FP.width;
        var yTo:int = (y + ySpeed) % FP.height;
        
        FP.log(xTo);
        FP.log(yTo);
         
        x = xTo < 0 ? FP.width + xTo : xTo;
        y = yTo < 0 ? FP.height + yTo : yTo;

    }
}
}