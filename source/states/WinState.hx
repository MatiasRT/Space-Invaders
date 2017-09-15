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
class WinState extends FlxState 
{
	private var victoria:FlxText;
	
	override public function create() 
	{
		FlxG.mouse.visible = true;
		victoria = new FlxText(65, 20, 0, "¡VICTORIA!", 56) ;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		var botonMenu = new FlxButton(x, 225, "Back to Menu", onMenu);
		
		add(victoria);
		add(botonMenu);
	}
	
	private function onMenu()
	{
		FlxG.switchState(new MenuStates());
	}
	
}