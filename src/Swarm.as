package
{
import com.grancalavera.swarm.view.stages.Stage;

import net.flashpunk.Engine;
import net.flashpunk.FP;
import net.flashpunk.utils.Key;

public class Swarm extends Engine
{
	public function Swarm()
	{
		super(480, 800);
	}
 
    private var currentStage:Stage; 
    
    override public function init():void
    {
        super.init();
        currentStage = new Stage();
        FP.world = currentStage;
        FP.world.begin();
        FP.console.toggleKey = Key.Q;
        FP.console.enable();
    }
}
}