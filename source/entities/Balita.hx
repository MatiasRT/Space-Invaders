package entities;

import entities.Enemigo;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Balita extends FlxSprite 
{
	private var normalVel:Float = 300;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		//makeGraphic(50, 50, FlxColor.WHITE);
		loadGraphic(AssetPaths.Disparito__png);
		scale.set(6,6);
		velocity.y = -600;
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		colisionEnemigo();
		if (this.y > FlxG.height - height) 
		{
			this.kill();
			//super.destroy();
		}
	}
	function colisionEnemigo()
	{
		/*if (FlxG.collide(this,) ) 
		{
			Enemigo.kill;
		}*/
	}
}