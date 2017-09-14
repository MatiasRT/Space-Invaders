package states;

import entities.BalaEnemiga;
import entities.Balita;
import entities.Estructuras;
import entities.Jugador;
import entities.Enemigo;
import entities.Ovni;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
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
	private var contadorOvni:Float = 8;
	private var spawnOvni:Bool = true;
	private var estructuritas:FlxTypedGroup<Estructuras>;
	private var ovnicito:Ovni;
	private var ganaste:FlxText;
	private var perdiste:FlxText;

	override public function create():Void
	{
		super.create();
		var comienzoDibujoX : Int = 50;
		var comienzoDibujoY : Int = 10;
		perdiste = new FlxText(FlxG.width / 2);
		perdiste.text = "Perdiste wey";
		
		
		FlxG.camera.bgColor = FlxColor.BLACK;
		
		
		balaenemiga = new BalaEnemiga(50 , 50);
		balaenemiga.loadGraphic(AssetPaths.Disparito__png);
		balaenemiga.velocity.y = 600;
		balaenemiga.kill();
		
		
		nave = new Jugador(310, 450);
		grupoEnemigo = new FlxTypedGroup<Enemigo>();
		enemy = new Enemigo(50, 50);
		estructuritas = new FlxTypedGroup<Estructuras>();
		ovnicito = new Ovni() ;
		
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
		add(ovnicito);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		colisionEnemigoNave();
		//colisionBalaEnemigo();
		colisionBalaGrupo();
		//colisiongrupo();
		TiroRandomXD();
		colisionbalas();
		colisionBalaEnemigaNave();
		fueraBalas();
		//paredesEnemigos();
		colisionBalaEnemigaEstructura();
		colisionBalitaEstructura();
		//bajaWacho();
		colisionEnemigoEstructura();
		colisionBalitaOvni();
		OvniRandomXD();
		paredesOvni();
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
				FlxG.sound.play(AssetPaths.muerteenemigo__wav);
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
	
	function OvniRandomXD()
	{
		trace(contadorOvni);
		contadorOvni += FlxG.elapsed;
		if (spawnOvni == true && contadorOvni >= 20)
		{
			ovnicito = new Ovni(FlxG.width + ovnicito.width, FlxG.height/3);
			//ovnicito.y = 50;
			spawnOvni = false;
			contadorOvni = 0;
			
		}
		
		add(ovnicito);
	}
	function paredesOvni()
	{
		if (ovnicito.x > FlxG.width)
		{
			ovnicito.kill(); 
			spawnOvni = true;
		}
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
				//FlxG.sound.play(AssetPaths.bloque__ogg);
				FlxG.sound.play(AssetPaths.bloque__wav);
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
				//FlxG.sound.play(AssetPaths.bloque__ogg);
				FlxG.sound.play(AssetPaths.bloque__wav);
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
	
	function colisionBalitaOvni()
	{
		if (FlxG.overlap(nave.disparito, ovnicito)) 
		{
			ovnicito.kill();
			nave.disparito.kill();
			spawnOvni = true;
		}
	}
	
	function colisionbalas()
	{
		if (FlxG.collide(balaenemiga, nave.disparito)) 
		{
			balaenemiga.kill();
			nave.disparito.kill();
		}
	}
	
	
	
	//Funciones que no funcan - no sirven
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
	
	

	/*function bajaWacho()
	{
		for (i in 0...grupoEnemigo.members.length) 
		{
			if (grupoEnemigo.members[i].x < 0)			
			{
				grupoEnemigo.members[i].y += 30;
				grupoEnemigo.members[i].velocity.x = -(grupoEnemigo.members[i].velocity.x);
			}
			if (grupoEnemigo.members[i].x > (FlxG.width - grupoEnemigo.members[i].width))
			{
				grupoEnemigo.members[i].velocity.x = -(grupoEnemigo.members[i].velocity.x);
				grupoEnemigo.members[i].y += 30;
				
			}
		}
										DE ACA PABAJO NO XD
		/*if (enemy.x < 0) 
		{
			//enemy.y += 30;
			for (i in 0...grupoEnemigo.members.length) 
			{
				grupoEnemigo.members[i].y += 30;
				//grupoEnemigo.members[1].velocity.x = -grupoEnemigo.members[1].velocity.x;
				
			}
		}
		if (enemy.x > (FlxG.width - enemy.width))
		{
			for (i in 0...grupoEnemigo.members.length) 
			{
				grupoEnemigo.members[i].y += 30;
				//grupoEnemigo.members[1].velocity.x = -grupoEnemigo.members[1].velocity.x;
			}
		}
	}*/
}