
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


		int boundsX = cpx-0.5*enemy.get_width()+enemy.get_width();//square value of the hero, using enemygetwidth because same size
		int boundsY = cpy-0.5*enemy.get_height()+enemy.get_height();
		int EnBoundsX = mx+enemy.get_width();//square value of monster
		int EnBoundsY = my+enemy.get_height();

		//if( (EnBoundsX>= cpx && EnBoundsX<= boundsX) &&  (EnBoundsY>=cpy && EnBoundsY<=boundsY) )			//collision when the arrow hits any part of the whole enemy sprite

		if( ( (mx >= cpx || EnBoundsX >= cpx ) && (EnBoundsX <= boundsX || mx<=boundsX) )  && ( (my >= cpy || EnBoundsY >= cpy) && (EnBoundsY <= boundsY || my <= boundsY) )   )
		{
			//collision on bottom and right
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
