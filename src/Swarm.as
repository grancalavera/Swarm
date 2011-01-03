package
{
import com.grancalavera.swarm.view.stages.Stage;
import com.grancalavera.swarm.view.stages.Stage_0001;

import net.flashpunk.Engine;
import net.flashpunk.FP;

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
        currentStage = new Stage_0001();
        FP.world = currentStage;
        
        //FP.console.enable();
    }
}
}