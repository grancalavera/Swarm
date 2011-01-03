package com.grancalavera.swarm.view.entities
{
import mx.utils.NameUtil;

import net.flashpunk.FP;

public class EnemySwarm
{

    private static const ROWS:uint = 9;
    private static const COLUMNS:uint = 27;
    private static const ROW_HEIGHT:uint = 32;
    private static const COLUMN_WIDTH:uint = 16;
    private static const EVEN_COL_OFFSET:uint = 16;
    
    public function EnemySwarm(x:Number = 0, y:Number = 0)
    {
        this.x = x;
        this.y = y;
        
        FP.log("new EnemwSwarm");
        
        generate();
    }
    
    public var x:Number;
    public var y:Number;
    
    
    private function generate():void
    {
        var i:Number; 
        var j:Number;
        
        for (i = 0; i < COLUMNS; i++)
        {
            for (j = 0; j < ROWS; j++)
            {
                
                FP.world.add(new Enemy(
                    i * COLUMN_WIDTH + x,
                    calculateEnemyY(i, j)
                ));
            }
        }
    }
    
    private function calculateEnemyY(columnIndex:uint, rowIndex:uint):Number
    {
        var enemyY:Number = rowIndex * ROW_HEIGHT;
        if (columnIndex % 2 != 0)
            enemyY += EVEN_COL_OFFSET;
        return enemyY + y;
    }
    
    public function update():void
    {
        
    }
}
}