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
	
	public var xOriginal:Float;
	
	public var contadorPuntaje(get, null):Int;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		contadorPuntaje = 0;
		
		loadGraphic(AssetPaths.invader2pekenioxd__png);
		velocity.x = 70;
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
	}
	
	function paredes()
	{
		if (x < 0)
		{
			velocity.x = -velocity.x;
			y += 30;
		}
		
		if (x > (FlxG.width - width))
		{	velocity.x = -velocity.x;	
			y += 30;
		}
	}
	
	public function addContador()
	{
		contadorPuntaje += 100;
	}
	
	function get_contadorPuntaje():Int
	{
		return contadorPuntaje;
	}
	
	
	
	
	//function disparo()					// Por Mati
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
	
	/*function disparo()						// Por Andy
	{
			disparito.reset(x - 2 + width / 2 , y + height / 2);
			disparito.velocity.y = (Balita.normalVel) *-1;
		
	}*/
}