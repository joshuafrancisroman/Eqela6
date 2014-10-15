
/*
 * MainMenu
 * Created by Eqela Studio 2.0b7.4
 */

public class MainMenu : SEScene
{
	SESprite start1;
	public void initialize(SEResourceCache rsc)
	{
		base.initialize(rsc);
		add_entity(SESpriteEntity.for_color(Color.instance("white"), get_scene_width(), get_scene_height()));
		rsc.prepare_font("style","arial bold color=black",60);
		start1 = add_sprite_for_text("START","style");
		start1.move(0.5*get_scene_width()-0.5*start1.get_width(),0.5*get_scene_height()-0.5*start1.get_height());
	}

	public void on_pointer_press(SEPointerInfo pi)
	{
		if(pi.is_inside(0.5*get_scene_width()-0.5*start1.get_width(),0.5*get_scene_height()-0.5*start1.get_height(),start1.get_x(),start1.get_y()))
		{
			//still error in quadrant 4. overlapping value
			switch_scene(new MainScene());
		}
	}	
}
