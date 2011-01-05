package com.grancalavera.swarm.view.entities
{
import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.Graphic;
import net.flashpunk.Mask;
import net.flashpunk.graphics.Image;

public class Bullet extends Entity
{

    [Embed(source="/assets/Bullet.png")]
    private static const BULLET:Class;
    
    public function Bullet(x:Number=0, y:Number=0)
    {
        super(x, y);
        graphic = new Image(BULLET);
        width = 2;
        height = 8;
    }
    
    public var speed:int = 0;
    public var direction:int = 0;
    
    override public function update():void
    {
        //y = speed * direction;
    }
}
}