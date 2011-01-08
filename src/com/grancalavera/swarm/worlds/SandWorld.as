package com.grancalavera.swarm.worlds
{
import com.grancalavera.swarm.entities.Ant;

import net.flashpunk.FP;
import net.flashpunk.World;

public class SandWorld extends World
{
    public function SandWorld()
    {
        super();
    }
    
    private var antCount:int = 10;
    
    override public function begin():void
    {
        for (var i:uint = 0; i < antCount; i++)
            add(new Ant());
    }

}
}