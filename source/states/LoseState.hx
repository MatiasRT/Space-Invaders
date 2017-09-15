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
	
	override public function create() 
	{
		FlxG.mouse.visible = true;
		derrota = new FlxText(90, 20, 0, "DERROTA", 56) ;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		var botonMenu = new FlxButton(x, 225, "Back to Menu", onMenu);
		
		add(derrota);
		add(botonMenu);
	}
	
	private function onMenu()
	{
		FlxG.switchState(new MenuStates());
	}
	
}