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
		makeGraphic(15, 15, FlxColor.WHITE);
		//loadGraphic(AssetPaths.ovni__png);
		velocity.x = 90;
		xOriginal = this.x;
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		updateHitbox();
		movimiento();
		restriccion();
	}
	
	function movimiento()
	{
		if (x < FlxG.width -FlxG.width)
		{
			x++;
		}
	}
	
	function restriccion()
	{
		if (x < 0)
		{
			velocity.x = -velocity.x;
		}
		
		if (x > (FlxG.width - width))
		{	
			//velocity.x = -velocity.x;
			kill();
		}
	}
}