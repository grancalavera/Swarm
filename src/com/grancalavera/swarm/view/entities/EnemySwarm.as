package com.grancalavera.swarm.view.entities
{
import mx.utils.NameUtil;

import net.flashpunk.FP;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;

public class EnemySwarm
{

    private static const ROWS:uint = 1;
    private static const COLUMNS:uint = 2;
    private static const ROW_HEIGHT:uint = 32;
    private static const COLUMN_WIDTH:uint = 16;
    private static const EVEN_COL_OFFSET:uint = 16;
    
    public function EnemySwarm(x:Number = 0, y:Number = 0)
    {
        this.x = x;
        this.y = y;
        generate();
    }
    
    public var x:Number;
    public var y:Number;
    
    private var directionX:int;
    private var directionY:int;
    private var directionChanged:Boolean;
    private var enemies:Vector.<AutonomousEnemy>;
    
    private function generate():void
    {
        var i:Number; 
        var j:Number;
        var e:AutonomousEnemy;
        enemies = new Vector.<AutonomousEnemy>();
        
        for (i = 0; i < COLUMNS; i++)
        {
            for (j = 0; j < ROWS; j++)
            {
                e = new AutonomousEnemy();
                /*
                    i * COLUMN_WIDTH + x,
                    calculateEnemyY(i, j)
                )
                */
                FP.world.add(e);
                enemies.push(e);
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
        if (Input.check(Key.SPACE))
        {
            directionX = directionY = 0;
            return;
        }
    
        if (Input.check(Key.UP))
        {
            goUp();
        }
        else if(Input.check(Key.DOWN))
        {
            goDown();
        }
                    
        if (Input.check(Key.LEFT))
        {
            goLeft();
        }
        else if(Input.check(Key.RIGHT))
        {
            goRight();
        }
        
        if (directionChanged)
            changeDirection();
    }
    
    public function goUp():void
    {
        directionX = 0;
        directionY = -1;
        directionChanged = true;
    }
    
    public function goDown():void
    {
        directionX = 0;
        directionY = 1;        
        directionChanged = true;
    }
    
    public function goLeft():void
    {
        directionX = -1;
        directionY = directionY;        
        directionChanged = true;
    }
    
    public function goRight():void
    {
        directionX = 1;
        directionY = directionY;
        directionChanged = true;
    }
    
    private function changeDirection():void
    {
        directionChanged = false;
        
        function applyChange(item:AutonomousEnemy, index:int, 
            vector:Vector.<AutonomousEnemy>):void
        {
            item.directionX = directionX;
            item.directionY = directionY;
        }

        enemies.forEach(applyChange, this);
    }
}
}