package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;

/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite 
{
	
	public var xOriginal:Int;
	
	public function new(?X:Int=0, ?Y:Int=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.invader2pekenioxd__png);
		velocity.x = 30;
		xOriginal = X;
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		updateHitbox();
		movimiento();
	}
	
	function movimiento()
	{	
		if (x <= xOriginal) 
		{
			velocity.x = -velocity.x;
			y = y + 30;
		}
		if (x >= xOriginal + 150)
		{
			velocity.x = -velocity.x;
			y = y + 30;
		}
	}
}