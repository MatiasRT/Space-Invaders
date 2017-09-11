package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;
//import flixel.FlxG.random;

/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite 
{
	//public var disparoEnemigo(get, null):Balita;
	public var xOriginal:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Invader2__png);
		velocity.x = 100;
		xOriginal = this.x;
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		updateHitbox();
		movimiento();
		paredes();
		//disparo();
	}
	
	function movimiento()
	{	
		
		if (x < FlxG.width -FlxG.width)
		{
			x++;
		}
		
		if (x > FlxG.width + FlxG.width) 
		{
			velocity.x = -velocity.x;
		} 
	}
	
	function paredes()
	{
		if (x < 0)
			velocity.x = -velocity.x;
		if (x > (FlxG.width - width))
			velocity.x = -velocity.x;		
	}
	
	//function disparo()
	//{
		//if (FlxG.random == true)
		//disparoEnemigo.reset(x - 2 + width / 2 , y + height / 2);
		//disparoEnemigo.velocity.y = (Balita.normalVel) *-1;
		//
	//}
	//
	//function get_disparoEnemigo():Balita
	//{
		//return disparoEnemigo;
	//}
}