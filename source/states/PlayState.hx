package states;

import entities.Jugador;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var nave:entities.Jugador;
	
	override public function create():Void
	{
		super.create();
		FlxG.camera.bgColor = FlxColor.BLACK;
		nave = new entities.Jugador(310, 400);
		
		add(nave);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}