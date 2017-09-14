package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import states.PlayState;

/**
 * ...
 * @author ...
 */
class MenuStates extends FlxState 
{
	//private var nombreJuego:FlxText;
	
	override public function create()
	{
		super.create();
		
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		//nombreJuego.text = "Space Invaders";
		
		var botonNuevoJuego = new FlxButton(x, 225, "New game", onNew);
		var botonSalir = new FlxButton(x, 300, "Exit", onExit);
		
		add(botonNuevoJuego);
		add(botonSalir);
		//add(nombreJuego);
	}
	
	private function onNew()
	{
		FlxG.switchState(new PlayState());
	}
	
	private function onExit()
	{
		trace("Exit...");
	}
}