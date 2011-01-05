package com.grancalavera.swarm.entities
{
import com.grancalavera.swarm.view.entities.EntityTypes;

import flash.geom.Point;

import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.Graphic;
import net.flashpunk.Mask;
import net.flashpunk.graphics.Image;

public class Ant extends Entity
{

    [Embed(source="/assets/Enemy.png")]
    private static const ANT:Class;
    
    public function Ant(x:Number=0, y:Number=0)
    {
        super(x, y);
        width = height = 16;
        graphic = new Image(ANT);
        type = EntityTypes.ANT;
        direction = getRandomDir();
    }
    
    private var speed:int = 5;
    private var direction:Point = new Point(0, 0);
    private var patience:int = 50; // steps (updates);
    private var waitingTime:int = 0;
    
    private static const NORTH:Point        = new Point( 0, -1);
    private static const NORTH_EAST:Point   = new Point( 1, -1);
    private static const EAST:Point         = new Point( 1,  0);
    private static const SOUTH_EAST:Point   = new Point( 1,  1);
    private static const SOUTH:Point        = new Point( 0,  1);
    private static const SOUTH_WEST:Point   = new Point(-1,  1);
    private static const WEST:Point         = new Point(-1,  0);
    private static const NORTH_WEST:Point   = new Point(-1, -1);
    
    override public function update():void
    {
        if (patience == waitingTime)
        {
            direction = getRandomDir();        
            waitingTime = 0;
        }
        else
        {
            waitingTime++;
        }
        
        var xTo:int = (x + speed * direction.x) % FP.width;
        var yTo:int = (y + speed * direction.y) % FP.height;
        
        x = xTo < 0 ? FP.width + xTo : xTo;
        y = yTo < 0 ? FP.height + yTo : yTo;
    }
    
    private function getRandomDir():Point
    {
        return new Point(
            getRandomAxDir(),
            getRandomAxDir()
        );
    }
    
    private function getRandomAxDir():int
    {
         return Math.floor(Math.random() * 3) - 1;
    }
    
    private function randRange(min:int, max:int):int
    {
        return Math.floor(Math.random() * (max - min + 1)) - 1;
    }
}
}