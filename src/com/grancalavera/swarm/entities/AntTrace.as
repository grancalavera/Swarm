package com.grancalavera.swarm.entities
{
import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.Graphic;
import net.flashpunk.Mask;
import net.flashpunk.graphics.Image;

public class AntTrace extends Entity
{
    [Embed(source="/assets/Ant.png")]
    private static const ANT_TRACE:Class;
    
    public function AntTrace(x:Number, y:Number, ant:Ant, timeToLive:int)
    {
        super(x, y);
        this.ant = ant;
        this.timeToLive = timeToLive;
        alphaStep = alpha / timeToLive;
        antTrace = new Image(ANT_TRACE);
        antTrace.alpha = alpha;
        graphic = antTrace;
        type = "antTrace";
    }
    
    private var antTrace:Image;
    private var timeToLive:int;
    private var alphaStep:Number;
    private var alpha:Number = 0.65;
    
    public var ant:Ant;

    override public function update():void
    {
        if (timeToLive == 0)
        {
            FP.world.remove(this);
            return;
        }
        
        timeToLive --;
        antTrace.alpha -= alphaStep;      
    }
}
}