package com.grancalavera.swarm.view.stages
{
import com.grancalavera.swarm.view.entities.AutonomousEnemy;
import com.grancalavera.swarm.view.entities.Enemy;
import com.grancalavera.swarm.view.entities.EnemySwarm;
import com.grancalavera.swarm.view.entities.Hero;
import com.grancalavera.swarm.view.entities.HeroBullet;

import flash.events.AccelerometerEvent;
import flash.sensors.Accelerometer;

import net.flashpunk.FP;
import net.flashpunk.World;
import net.flashpunk.graphics.Image;

public class Stage extends World
{

    private static const TILTED_UP:int = -1;
    private static const TILTED_DOWN:int = 1;
    private static const TILTED_LEFT:int = -1;
    private static const TILTED_RIGHT:int = 1;
        
    public function Stage()
    {
        super();
    }
    
    private var accl:Accelerometer;
    private var hero:Hero;
    private var swarm:EnemySwarm;
    
    private var hTilt:int = 0;
    private var vTilt:int = 0;
    
    override public function begin():void
    {
        swarm = new EnemySwarm(24, 24);
        
        var count:int = 3;
        var gap:Number = FP.width / count;
        
        for (var i:int = 1; i <= count; i++)
        {
            add(new HeroBullet(i * gap, FP.halfHeight));
        }
        
        if (Accelerometer.isSupported)
        {
            accl = new Accelerometer();
            accl.addEventListener(AccelerometerEvent.UPDATE, accl_updateHandler);
        }
    }
    
    override public function update():void
    {
        super.update();
        swarm.update();
    }
    
    private function accl_updateHandler(event:AccelerometerEvent):void
    {
        var newHTilt:int = event.accelerationX > 0 ? TILTED_LEFT : TILTED_RIGHT;
        var newVTilt:int = event.accelerationY > 0 ? TILTED_DOWN : TILTED_UP;
        
        if (newHTilt != hTilt)
        {
            hTilt = newHTilt;
            
            if (hTilt == TILTED_LEFT)
                swarm.goLeft();
            else
                swarm.goRight();
        }
        
        if (newVTilt != vTilt)
        {
            vTilt = newVTilt;
            
            if (vTilt == TILTED_UP)
                swarm.goUp();
            else
                swarm.goDown();
        }
    }
}
}