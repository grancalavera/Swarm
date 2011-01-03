package com.grancalavera.swarm.view.entities
{
import flash.events.AccelerometerEvent;
import flash.events.StatusEvent;
import flash.geom.Rectangle;
import flash.sensors.Accelerometer;

import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.Graphic;
import net.flashpunk.Mask;
import net.flashpunk.graphics.Image;

public class Hero extends Entity
{

    [Embed(source="/assets/Hero.png")]
    private static const HERO:Class;
    
    public function Hero()
    {
        super();
        width = height = 32;
        
        x = (FP.width / 2) - (width / 2);
        y = FP.height - (height * 3);
        
        graphic = new Image(HERO);
        
        bounds = new Rectangle(
            24,
            24,
            (FP.width - 24) - width,
            (FP.height - (height * 2)) - height
        );
        
        if (Accelerometer.isSupported)
        {
            accl = new Accelerometer();
            accl.addEventListener(AccelerometerEvent.UPDATE, accl_updateHandler);
        }
    }

    private var accl:Accelerometer;
    private var lastAccUpdate:AccelerometerEvent;
    private var bounds:Rectangle;
    
    override public function update():void
    {
        x -= lastAccUpdate.accelerationX * 30;
        FP.log(x);
    }

    private function accl_updateHandler(event:AccelerometerEvent):void
    {
        lastAccUpdate = event.clone() as AccelerometerEvent;
    }

}
}