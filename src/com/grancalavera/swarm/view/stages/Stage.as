package com.grancalavera.swarm.view.stages
{
import com.grancalavera.swarm.view.entities.Hero;

import net.flashpunk.FP;
import net.flashpunk.World;
import net.flashpunk.graphics.Image;

public class Stage extends World
{

    public function Stage()
    {
        super();
        hero = new Hero();
        add(hero);
    }
    
    private var hero:Hero;
}
}