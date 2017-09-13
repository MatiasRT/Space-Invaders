package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class BalaEnemiga extends FlxSprite 
{
	static public var normalVel:Float = 300;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Disparito__png);
		//scale.set(6,6);
		velocity.y = 800;
	}
	
}