package com.grancalavera.swarm.view.stages
{
import com.grancalavera.swarm.view.entities.EnemySwarm;
import com.grancalavera.swarm.view.entities.Hero;

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
    }
    
    private var hero:Hero;
    private var swarm:EnemySwarm;
}
}