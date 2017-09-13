package states;

import entities.BalaEnemiga;
import entities.Balita;
import entities.Estructuras;
import entities.Jugador;
import entities.Enemigo;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup.FlxTypedGroup;
import lime.graphics.console.RenderState.BlendState;
import flixel.math.FlxRandom;
import neko.Random;

class PlayState extends FlxState
{
	private var nave:Jugador;
	private var enemy:Enemigo;
	private var grupoEnemigo:FlxTypedGroup<Enemigo>;
	private var balaenemiga(get, null):BalaEnemiga;
	private var r:Random;
	private var contadorDisparoEnemigo:Float = 3;
	private var EnemigoPuedeDisparar:Bool = true;
	private var estructuritas:FlxTypedGroup<Estructuras>;

	override public function create():Void
	{
		super.create();
		var comienzoDibujoX : Int = 50;
		var comienzoDibujoY : Int = 10;
		
		
		FlxG.camera.bgColor = FlxColor.BLACK;
		
		
		balaenemiga = new BalaEnemiga(50 , 50);
		balaenemiga.loadGraphic(AssetPaths.Disparito__png);
		balaenemiga.velocity.y = 600;
		balaenemiga.kill();
		
		
		nave = new Jugador(310, 450);
		grupoEnemigo = new FlxTypedGroup<Enemigo>();
		enemy = new Enemigo(25, 25);
		estructuritas = new FlxTypedGroup<Estructuras>();
		//estructuritas.add(new Estructuras(200, 200));
		
		//Comienzo enemigos
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
		comienzoDibujoX = 50;
		
		// Cominezo estructuras
		for (i in 0...10) 
		{
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 380));
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 370));
			comienzoDibujoX += 10;
		}
		comienzoDibujoX += 120;
		for (i in 0...10) 
		{
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 370));
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 380));
			comienzoDibujoX += 10;
			
		}
		comienzoDibujoX += 120;
		for (i in 0...10) 
		{
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 370));
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 380));
			comienzoDibujoX += 10;
			
		}
		
		//var r:Int = (grupoEnemigo.length /2);
		add(balaenemiga);
		add(grupoEnemigo);
		add(nave);
		add(estructuritas);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		colisionEnemigoNave();
		//colisionBalaEnemigo();
		colisionBalaGrupo();
		//colisiongrupo();
		TiroRandomXD();
		//colisionbalas();
		colisionBalaEnemigaNave();
		fueraBalas();
		//paredesEnemigos();
		colisionBalaEnemigaEstructura();
		colisionBalitaEstructura();
		//bajaWacho();
		colisionEnemigoEstructura();
	}
	
	function colisionEnemigoNave()
	{
		if (FlxG.collide(nave,enemy)) 
		{
			nave.kill();
		}
	}

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
	
	function TiroRandomXD()
	{
		contadorDisparoEnemigo += FlxG.elapsed;
		for (enemy in grupoEnemigo)
		{
			if (grupoEnemigo.getRandom() == enemy)
			{			
				if (contadorDisparoEnemigo >= 2 && EnemigoPuedeDisparar == true)
				{	
					balaenemiga.alive == true;
					balaenemiga.reset(enemy.x, enemy.y);
					/*balaenemiga.x = enemy.x;
					balaenemiga.y = enemy.y;*/
					contadorDisparoEnemigo = 0;
				}
			}
		}
		balaenemiga.velocity.y = (BalaEnemiga.normalVel);
	}
	
	function get_balaenemiga():BalaEnemiga 
	{
		return balaenemiga;
	}
	
	function colisionBalaEnemigaNave()
	{
		if (FlxG.collide(nave, balaenemiga)) 
		{
			nave.kill();
			balaenemiga.kill();
		}
	}
	
	function fueraBalas()
	{
		if (balaenemiga.y > FlxG.height)
		{
			balaenemiga.kill(); 
		}
	}
	
	function colisionBalaEnemigaEstructura()
	{
		for (i in 0...estructuritas.members.length) 
		{
			if (FlxG.overlap(balaenemiga, estructuritas.members[i])) 
			{
				balaenemiga.kill();
				estructuritas.remove(estructuritas.members[i], true);
			}
		}
	}
	
	function colisionBalitaEstructura()
	{
		for (i in 0...estructuritas.members.length) 
		{
			if (FlxG.overlap(nave.disparito, estructuritas.members[i])) 
			{
				nave.disparito.kill();
				estructuritas.remove(estructuritas.members[i], true);
			}
		}
	}
	
	function colisionEnemigoEstructura()
	{
		for (i in 0...estructuritas.members.length) 
		{
			if (FlxG.overlap(grupoEnemigo, estructuritas.members[i])) 
			{
				estructuritas.remove(estructuritas.members[i], true);
				
			}
		}
	}
	
	function paredesEnemigos()
	{
		/*for (enemy in grupoEnemigo) 
		{
			if (enemy.x < 0)
				for (enemy in grupoEnemigo) 
				{
					enemy.velocity.x = -enemy.velocity.x;
				}
			
			if (enemy.x > (FlxG.width))
				for (enemy in grupoEnemigo) 
				{                            
					enemy.velocity.x = -enemy.velocity.x;
				}
			
		}*/
		
	}
	/*function colisiongrupo()
	{
		if (FlxG.collide(Any. 
		{
			enemy.velocity.x = -velocity.x;
		}	
	}*/
	
	/*function colisionbalas()
	{
		if (FlxG.collide(balaenemiga,)) 
		{
			balaenemiga.kill();
			
		}
	}*/
	
	//function bajaWacho()
	//{
		//if (enemy.x < 0) 
		//{
			////enemy.y += 30;
			//for (i in 0...grupoEnemigo.members.length) 
			//{
				//grupoEnemigo.members[i].y += 30;
				////grupoEnemigo.members[1].velocity.x = -grupoEnemigo.members[1].velocity.x;
				//
			//}
		//}
		////if (enemy.x > (FlxG.width - enemy.width))
		////{
			////for (i in 0...grupoEnemigo.members.length) 
			////{
				////grupoEnemigo.members[i].y += 30;
				////
			////}
		////}
	//}
}