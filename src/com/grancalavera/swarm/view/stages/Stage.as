package com.grancalavera.swarm.view.stages
{
import com.grancalavera.swarm.view.entities.AutonomousEnemy;
import com.grancalavera.swarm.view.entities.Enemy;
import com.grancalavera.swarm.view.entities.EnemySwarm;
import com.grancalavera.swarm.view.entities.Hero;
import com.grancalavera.swarm.view.entities.HeroBullet;

import net.flashpunk.FP;
import net.flashpunk.World;
import net.flashpunk.graphics.Image;

public class Stage extends World
{

    public function Stage()
    {
        super();
    }
    
    override public function begin():void
    {
        hero = new Hero();
        add(hero);
        swarm = new EnemySwarm(24, 24);
        
        var anchor:int = 48;
        var count:int = 10;
        
        for (var i:int = 1; i <= count; i++)
        {
            add(new HeroBullet(i * anchor, FP.halfHeight));
        }
    }
    
    override public function update():void
    {
        super.update();
        swarm.update();
    }
    
    private var hero:Hero;
    private var swarm:EnemySwarm;
}
}