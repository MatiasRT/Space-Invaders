package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.MenuStates;

class Main extends Sprite
{

	public function new()
	{
		super();
		//Solo juego
		//addChild(new FlxGame(0, 0, states.PlayState));
		//var gameWidth:Int = 320;
		//var gameHeight:Int = 240;
		//var zoom:Float = 200;
		
		//Agregar menu 
		addChild(new FlxGame(0, 0, MenuStates));
		//var initialState:Class = MenuStates;
		
	}
}