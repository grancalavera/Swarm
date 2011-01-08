package com.grancalavera.swarm.entities
{
import com.grancalavera.swarm.view.entities.EntityTypes;

import flash.geom.Point;
import flash.utils.getTimer;

import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.Graphic;
import net.flashpunk.Mask;
import net.flashpunk.graphics.Image;
import net.flashpunk.tweens.misc.Alarm;

public class Ant extends Entity
{

    [Embed(source="/assets/Ant.png")]
    private static const ANT:Class;
    
    public function Ant(x:Number=0, y:Number=0, lifeExpectancy:int=10)
    {
        super();
        
        this.x = x || randRange(0, FP.width);
        this.y = y || randRange(0, FP.height);
        
        width = height = 2;
        graphic = new Image(ANT);
        type = EntityTypes.ANT;
        
        direction = getRandomDir();
        speed = randRange(1, 5);
        patience = randRange(20, 100);
        
        this.lifeExpectancy = this.timeToLive = lifeExpectancy;
    }
    
    private var speed:int;
    private var direction:Point = new Point(0, 0);
    private var patience:int; // steps (updates);
    private var waitingTime:int = 0;
    private var lifeExpectancy:int;
    public var timeToLive:int;
    public var parent:Ant;
    
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
        var collidedTrace:AntTrace = collide("antTrace", x, y) as AntTrace;
        if (collidedTrace && !isFamily(collidedTrace.ant))
        {
            timeToLive += collidedTrace.ant.timeToLive;
            FP.world.remove(collidedTrace.ant);
        }
        
        if (timeToLive > (lifeExpectancy * 3))
            reproduce();
        
        if (patience == waitingTime || collide(type, x, y))
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
        
        FP.world.add(new AntTrace(x, y, this, timeToLive));
    }
    
    private function reproduce():void
    {
        var offspring:Ant = new Ant(x, y, timeToLive);
        offspring.parent = this;
        FP.world.add(offspring);
        timeToLive = lifeExpectancy;
    }
    
    private function isFamily(collidedAnt:Ant):Boolean
    {
        var isMe:Boolean = collidedAnt == this;
        var isMyFather:Boolean = collidedAnt == this.parent;
//        var isMySibling:Boolean = (collidedAnt.parent !=null) &&
//            (collidedAnt.parent == this.parent);
        return isMe || isMyFather;// || isMySibling;
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