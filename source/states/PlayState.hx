package states;

import entities.Balita;
import entities.Jugador;
import entities.Enemigo;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	private var nave:Jugador;
	private var enemy:Enemigo;
	private var grupoEnemigo:FlxTypedGroup<Enemigo>;
	
	override public function create():Void
	{
		super.create();
		var comienzoDibujoX : Int = 50;
		var comienzoDibujoY : Int = 0;
		FlxG.camera.bgColor = FlxColor.BLACK;
		nave = new Jugador(310, 400);
		grupoEnemigo = new FlxTypedGroup<Enemigo>();
		enemy = new Enemigo(25, 25);
		
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX, comienzoDibujoY));
			
			comienzoDibujoX += 35;
		}
		comienzoDibujoX = 50;
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX, comienzoDibujoY + 30));
			
			comienzoDibujoX += 35;
		}
		comienzoDibujoX = 50;
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX, comienzoDibujoY + 60));
			
			comienzoDibujoX += 35;
		}
		comienzoDibujoX = 50;
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX, comienzoDibujoY + 90));
			
			comienzoDibujoX += 35;
		}
		comienzoDibujoX = 50;
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX, comienzoDibujoY + 120));
			
			comienzoDibujoX += 35;
		}
		add(grupoEnemigo);
		add(nave);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		colisionEnemigoNave();
		//colisionBalaEnemigo();
		colisionBalaGrupo();
	}
	
	function colisionEnemigoNave()
	{
		if (FlxG.collide(nave,enemy)) 
		{
			nave.kill();
		}
	}
	
	/*function colisionBalaEnemigo()
	{
		if (FlxG.collide( nave.disparito,enemy)) 
		{
			enemy.kill();
			nave.disparito.kill();
		}
	}*/
	
	function colisionBalaGrupo()
	{
		for (i in 0...grupoEnemigo.members.length) 
		{
			if (FlxG.overlap(grupoEnemigo.members[i], nave.disparito))
			{
				grupoEnemigo.remove(grupoEnemigo.members[i], true);
				nave.disparito.kill();
			}
		}
	}
}