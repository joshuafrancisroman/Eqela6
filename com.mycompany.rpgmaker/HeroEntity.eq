
/*
 * HeroEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class HeroEntity : SEEntity
{
	public static SESprite hero;
	int w;
	int h;
	int wp;//size of heroImage
	int hp;
	int score;
	public void initialize(SEResourceCache rsc)
	{
		w = get_scene_width();
		h = get_scene_height();
		base.initialize(rsc);
		rsc.prepare_image("hero","player",0.1*w,0.1*h);
		
		hero = add_sprite_for_image(SEImage.for_resource("hero"));
		wp = hero.get_width();
		hp = hero.get_height();
		hero.move(0.5*w-0.5*wp,0.5*h-0.5*hp);//*0.5 to get to middle of image and scene
	}

	
	public void cleanup()
	{
		base.cleanup();
	}
	
	public void tick(TimeVal now, double delta)
	{
		base.tick(now, delta);
		hero.move(MainScene.x-0.5*wp,MainScene.y-0.5*hp);//deduct the middle of the image so the cursor would be in the middle of the image
	}
	
}
