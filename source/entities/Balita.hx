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
	static public var normalVel:Float = 400;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.Disparito__png);
		velocity.y = -800;
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}