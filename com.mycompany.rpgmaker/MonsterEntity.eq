
/*
 * MonsterEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class MonsterEntity: SEEntity
{
	SESprite enemy;
	int w;
	int h;
	int wp;//size of enemyImage
	int hp;
	int mx;//monster x
	int my;//monster y
	int cpx;//player x-coor added c because px already used 
	int cpy;//player y-coor
	
	public void initialize(SEResourceCache rsc)
	{
		w = get_scene_width();
		h = get_scene_height();
		base.initialize(rsc);
		rsc.prepare_image("enemy","monster",0.1*w,0.1*h);
		rsc.prepare_image("enemy2","monster2",0.1*w,0.1*h);
		enemy = add_sprite_for_image(SEImage.for_resource("enemy"));
		wp = enemy.get_width();
		hp = enemy.get_height();
		enemy.move(Math.random(0,get_scene_width()),Math.random(0,get_scene_height()));

	}
	public void cleanup()
	{
		base.cleanup();
	}
	

	public void tick(TimeVal now, double delta)
	{
		base.tick(now, delta);
	
		cpx = MainScene.x;
		cpy = MainScene.y;

		mx = enemy.get_x();
		my = enemy.get_y();

		if(cpx==mx && cpy==my)
		{
			MainScene.gameover=true;
		}
		
		else if(cpx>mx)
		{
			enemy.set_image(SEImage.for_resource("enemy2"));
			
		}
		else
		{
			enemy.set_image(SEImage.for_resource("enemy"));
		}
		enemy.move(mx+(cpx-mx)/Math.random(10,100),my+(cpy-my)/Math.random(10,100));//formula for the enemy to move towards you
		//using the monster x and the mouses x, computing a displacement value 
	
	}
	
}
