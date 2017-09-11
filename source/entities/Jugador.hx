package entities;

import entities.Balita;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Jugador extends FlxSprite
{
	public var disparito(get, null):Balita;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.navenaranja__png);
		disparito = new Balita(x, y, AssetPaths.Disparito__png);
		disparito.kill();
		FlxG.state.add(disparito);
		updateHitbox();
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (disparito.y < 0)
		{
			disparito.kill(); 
		}
		movimiento();
		paredes();
		disparo();
	}
	
	private function movimiento()
	{
		if (FlxG.keys.pressed.RIGHT)
		{
			x += 3 * 60 * FlxG.elapsed;
		}
		if (FlxG.keys.pressed.LEFT)
			x -= 3 * 60 * FlxG.elapsed;
	}
	
	private function paredes()
	{
		if (x < 0)
			x = 0;
		if (x > (FlxG.width - width))
			x = FlxG.width - width;
	}
	
	function disparo()
	{
		if (FlxG.keys.justPressed.SPACE && disparito.alive==false)
		{
			disparito.reset(x - 2 + width / 2 , y + height / 2);
			disparito.velocity.y = (Balita.normalVel) *-1;
		}
	}

	function get_disparito():Balita
	{
		return disparito;
	}
}