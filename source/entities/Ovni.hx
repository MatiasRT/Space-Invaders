package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Ovni extends FlxSprite 
{
	public var xOriginal:Float;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
<<<<<<< Updated upstream
=======
		makeGraphic(15, 15, FlxColor.WHITE);
		loadGraphic(AssetPaths.Ovnicito__png);
		scale.set(2,2);
		velocity.x = 90;
>>>>>>> Stashed changes
		xOriginal = this.x;
		scale.set(2, 2);
		updateHitbox();
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		
		movimiento();
		restriccion();
	}
	
	function movimiento()
	{
		x -= 2 * 10 * FlxG.elapsed;
	}
	
	function restriccion()
	{
		if (x < 0) 
		{
			kill();
		}
	}
	
	
}