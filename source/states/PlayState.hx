package states;

import entities.Jugador;
import entities.Enemigo;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var nave:entities.Jugador;
	private var enemy:Enemigo;
	
	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.BLACK;
		nave = new entities.Jugador(310, 400);
		enemy= new Enemigo(25,25);
		
		add(nave);
		add(enemy);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		colision();
	}
	function colision()
	{
		if (FlxG.collide(nave,enemy)) 
		{
			nave.kill();
		}
	}
}