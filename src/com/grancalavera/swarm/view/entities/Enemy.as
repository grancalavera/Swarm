package com.grancalavera.swarm.view.entities
{
import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.Graphic;
import net.flashpunk.Mask;
import net.flashpunk.graphics.Image;

public class Enemy extends Entity
{

    [Embed(source="/assets/Enemy.png")]
    public static const ENEMY:Class;
    
    public function Enemy(x:Number=0, y:Number=0)
    {
        super(x, y);
        graphic = new Image(ENEMY);
        width = height = 16;
        type = EntityTypes.ENEMY;
    }
    
    override public function update():void
    {

    }    
}
}