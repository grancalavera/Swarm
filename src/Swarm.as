package
{
import com.grancalavera.swarm.view.stages.Stage;
import com.grancalavera.swarm.worlds.SandWorld;

import net.flashpunk.Engine;
import net.flashpunk.FP;
import net.flashpunk.utils.Key;

public class Swarm extends Engine
{
	public function Swarm()
	{
		super(400, 400);
	}
 
    override public function init():void
    {
        super.init();
        FP.world = new SandWorld();
        FP.world.begin();
        FP.console.enable();
        FP.console.toggleKey = Key.Q;
//        FP.console.debug = true;
//        FP.console.paused = true;
        
    }
}
}