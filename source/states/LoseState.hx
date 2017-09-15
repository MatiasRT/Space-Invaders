package states;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ...
 */
class LoseState extends FlxState 
{

	private var derrota:FlxText;
	private var mensaje:FlxText;
	
	override public function create() 
	{
		FlxG.mouse.visible = true;
		derrota = new FlxText(90, 20, 0, "DERROTA", 56) ;
		mensaje = new FlxText(10, 100, 0, "Los Beiders te han consumido", 26) ;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		var botonMenu = new FlxButton(x, 300, "Back to Menu", onMenu);
		var botonRestart = new FlxButton(x, 225, "Restart", onRestart);
		
		add(derrota);
		add(mensaje);
		add(botonMenu);
		add(botonRestart);
	}
	
	private function onMenu()
	{
		FlxG.switchState(new MenuStates());
	}
	
	private function onRestart()
	{
		FlxG.switchState(new PlayState());
	}
	
}