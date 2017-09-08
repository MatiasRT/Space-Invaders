package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite 
{
	public var xOriginal:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Invader2__png);
		
		/*makeGraphic(20, 20, FlxColor.WHITE); */
		velocity.x = 100;
		xOriginal = this.x;
		
		
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		updateHitbox();
		movimiento();
		paredes();
		
	}
		function movimiento()
	{	
		
		if (x < FlxG.width -FlxG.width)
		{
			x++;
		}
		
		if (x > FlxG.width + FlxG.width) 
		{
			/*x = xOriginal + 8;*/
			velocity.x = -velocity.x;
		} 
		
		/*if (x < 0)
		x = 0;
		if (x > FlxG.width - width) 
			y = y + 50;
			x = x + 5;
			velocity.x = -x;
			
		if (x == FlxG.width - width) 
		{
			y = y + 50;
			x = x +5;
			velocity.x = 100;
		}
		if (x< FlxG.width - width) 
			y = y + 50;*/
	}
		function paredes()
	{
		if (x < 0)
			velocity.x = -velocity.x;
		if (x > (FlxG.width - width))
			velocity.x = -velocity.x;		
	}
}