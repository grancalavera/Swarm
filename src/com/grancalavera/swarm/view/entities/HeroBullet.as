package com.grancalavera.swarm.view.entities
{
public class HeroBullet extends Bullet
{
    public function HeroBullet(x:Number=0, y:Number=0)
    {
        super(x, y);
        this.type = EntityTypes.HERO_BULLET;
    }
}
}