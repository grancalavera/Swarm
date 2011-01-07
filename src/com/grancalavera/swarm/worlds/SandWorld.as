package com.grancalavera.swarm.worlds
{
import com.grancalavera.swarm.entities.Ant;

import net.flashpunk.World;

public class SandWorld extends World
{
    public function SandWorld()
    {
        super();
    }
    
    private var ants:Vector.<Ant>;
    private var antCount:int = 150;
    
    override public function begin():void
    {
        ants = new Vector.<Ant>();
        
        for (var i:uint = 0; i < antCount; i++)
            ants.push(add(new Ant()));
    }
}
}