package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Jugador extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.navenaranja__png);
		//scale.set(300, 300);
		updateHitbox();
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		
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
			x = FlxG.width- width;
	}
	function disparo()
	{
		if (FlxG.keys.justPressed.SPACE) 
		{
			var disparito:Balita = new Balita();
			disparito.x = this.x + ((width / 2)-6);
			disparito.y = this.y + height / 2;
			
			FlxG.state.add(disparito);
		}
	}
}