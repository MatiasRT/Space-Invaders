package entities;

import entities.Balita;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import entities.BalaEnemiga;

/**
 * ...
 * @author ...
 */
class Jugador extends FlxSprite
{
	public var disparito(get, null):Balita;
	//public var vidas:Int;
	//private var grupoVidas:FlxTypedGroup<FlxSprite>;

	public function new(?X:Float=80, ?Y:Float=140, ?SimpleGraphic:FlxGraphicAsset) /*?vidas:Int*/
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.naveloidenaranjoidexd__png);
		disparito = new Balita(x, y, AssetPaths.Disparito__png);
		disparito.kill();
		FlxG.state.add(disparito);		
		//this.vidas = vidas;
		//grupoVidas = new FlxTypedGroup<FlxSprite>();
		updateHitbox();
		
		//for (i in 0...vidas) 
		//{
			//var corazon:FlxSprite = new FlxSprite(50,50,AssetPaths.Vida__png);
			//grupoVidas.add(corazon);
		//}
		//FlxG.state.add(grupoVidas);
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (disparito.y < 0)
			disparito.kill(); 
		
		movimiento();
		paredes();
		disparo();
	}
	
	private function movimiento()
	{
		if (FlxG.keys.pressed.RIGHT)
			x += 3 * 60 * FlxG.elapsed;
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
	
	//public function revivir()
	//{
		//vidas--;
		//if (!alive && vidas != 0) 
		//{
			//reset(10, 10);
			//grupoVidas.members[vidas].destroy();
		//}
		//
	//}
	
	function disparo()
	{
		if (FlxG.keys.justPressed.SPACE && disparito.alive==false)
		{
			disparito.reset(x - 2 + width / 2 , y + height / 2);
			disparito.velocity.y = (Balita.normalVel) *-1;
		}
	}

	public function get_disparito():Balita
	{
		return disparito;
	}
}