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
	private var nombreUno:FlxText;
	private var nombreDos:FlxText;
	private var nombreComp:FlxText;
	
	override public function create()
	{
		super.create();
		
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		nombreUno = new FlxText (100, 20, 0, "SPEISING", 56); 
		nombreDos = new FlxText (130, 80, 0, "BEIDERS", 48); 
		nombreComp = new FlxText (130, 390, 0, "© 2017 Timaan Corporation", 12);
		var botonNuevoJuego = new FlxButton(x, 225, "New game", onNew);
		var botonSalir = new FlxButton(x, 300, "Exit", onExit);
		
		add(botonNuevoJuego);
		add(botonSalir);
		add(nombreUno);
		add(nombreDos);
		add(nombreComp);
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