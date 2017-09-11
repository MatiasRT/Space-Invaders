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
	static public var normalVel:Float = 300;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Disparito__png);
		scale.set(6,6);
		velocity.y = -800;
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);		
	}
}