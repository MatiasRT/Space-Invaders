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
import flixel.group.FlxGroup.FlxTypedGroup;
import lime.graphics.console.RenderState.BlendState;
import flixel.math.FlxRandom;

class PlayState extends FlxState
{
	private var nave:Jugador;
	private var enemy:Enemigo;
	private var grupoEnemigo:FlxTypedGroup<Enemigo>;
	private var balaenemiga(get, null):BalaEnemiga;
	private var contadorDisparoEnemigo:Float = 3;
	private var EnemigoPuedeDisparar:Bool = true;
	private var contadorOvni:Float = 8;
	private var spawnOvni:Bool = true;
	private var estructuritas:FlxTypedGroup<Estructuras>;
	private var ovnicito(get, null):Ovni;
	private var puntaje:FlxText;
	private var resultado:Bool;
	private var ovnirandom:Int;
	private var puntos:Int = 0;

	override public function create():Void
	{
		super.create();
		var comienzoDibujoX : Int = 30;
		var comienzoDibujoY : Int = 10;
		FlxG.mouse.visible = false;
		puntaje = new FlxText(2, 2, 0, "PUNTAJE", 12);
		
		
		FlxG.camera.bgColor = FlxColor.BLACK;
		
		
		balaenemiga = new BalaEnemiga(50 , 50);
		balaenemiga.loadGraphic(AssetPaths.Disparito__png);
		balaenemiga.velocity.y = 600;
		balaenemiga.kill();
		
		
		nave = new Jugador(215, 390);
		grupoEnemigo = new FlxTypedGroup<Enemigo>();
		enemy = new Enemigo(50, 50);
		estructuritas = new FlxTypedGroup<Estructuras>();
<<<<<<< Updated upstream
		ovnicito = new Ovni(140, 100, AssetPaths.OVniiiii__png);
		FlxG.state.add(ovnicito);
		ovnicito.kill();
=======
		ovnicito = new Ovni();
>>>>>>> Stashed changes
		
		//Comienzo enemigos
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX - 30, comienzoDibujoY + 30));
			comienzoDibujoX += 43;
		}
		comienzoDibujoX = 30;
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX - 30, comienzoDibujoY + 60));
			comienzoDibujoX += 43;
		}
		comienzoDibujoX = 30;
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX - 30, comienzoDibujoY + 90));
			comienzoDibujoX += 43;
		}
		comienzoDibujoX = 30;
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX - 30, comienzoDibujoY + 120));
			comienzoDibujoX += 43;
		}
		comienzoDibujoX = 30;
		for (i in 0...8) 
		{
			grupoEnemigo.add(new Enemigo(comienzoDibujoX - 30, comienzoDibujoY + 150));
			comienzoDibujoX += 43;
		}
		comienzoDibujoX = 30;
		
		// Cominezo estructuras
		for (i in 0...10) 
		{
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 355));
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 345));
			comienzoDibujoX += 10;
		}
		comienzoDibujoX += 58;
		for (i in 0...10) 
		{
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 355));
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 345));
			comienzoDibujoX += 10;
			
		}
		comienzoDibujoX += 58;
		for (i in 0...10) 
		{
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 355));
			estructuritas.add(new Estructuras(comienzoDibujoX, comienzoDibujoY + 345));
			comienzoDibujoX += 10;
			
		}
		
		
		add(balaenemiga);
		add(grupoEnemigo);
		add(nave);
		add(estructuritas);
		//add(ovnicito);
		add(puntaje);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (grupoEnemigo.length == 0) 
		{
			resultado = true;
			finJuego();
		}
=======
		OvniRandomXD();
>>>>>>> Stashed changes
		colisionEnemigoNave();
		colisionBalaGrupo();
		TiroRandomXD();
		colisionbalas();
		colisionBalaEnemigaNave();
		fueraBalas();
		colisionBalaEnemigaEstructura();
		colisionBalitaEstructura();
		colisionEnemigoEstructura();
		colisionBalitaOvni();
		puntajePantalla();
		OvniRandomXD();
		colisionOvni();
=======
		paredesOvni();
>>>>>>> Stashed changes
	}
	
	function colisionEnemigoNave()
	{
		if (FlxG.overlap(nave,enemy)) 
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
				
				//enemy.addContador();
				
				nave.disparito.kill();
				
				contadorPuntajeEnemigo();
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
		if (ovnicito.alive==false) 
		{
			
			var Random = new FlxRandom();
			
			ovnirandom = Random.int(0, 300);
=======
			ovnicito = new Ovni(10, 30);
			//ovnicito.y = 50;
			spawnOvni = false;
			contadorOvni = 0;
>>>>>>> Stashed changes
			
			if (ovnirandom == 5) 
			{
				ovnicito.reset(432, 35);
				add(ovnicito);
			}
		}
<<<<<<< Updated upstream
=======
		spawnOvni == false;
		add(ovnicito);
>>>>>>> Stashed changes
	}
	
	function colisionOvni()
	{
		if (FlxG.overlap(ovnicito, nave.disparito))
		{
			ovnicito.kill(); 
		}
	}
	
	function get_ovnicito():Ovni
	{
		return ovnicito;
	}
	
	function get_balaenemiga():BalaEnemiga 
	{
		return balaenemiga;
	}
	
	function colisionBalaEnemigaNave()
	{
		if (FlxG.overlap(balaenemiga, nave)) 
		{
			nave.kill();
			balaenemiga.kill();
			resultado = false;
			finJuego();
			
			
			//nave.revivir();
			//if (nave.vidas == 0) 
			//{
				//resultado = false;
				//finJuego();
			//}
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
				//FlxG.sound.play(AssetPaths.bloque__wav);
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
				//FlxG.sound.play(AssetPaths.bloque__wav);
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
			contadorPuntajeOvni();
			
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
	
	public function contadorPuntajeEnemigo()
	{
		puntos += 100;
	}
	
	public function contadorPuntajeOvni()
	{
		puntos += 250;
	}
	
	public function puntajePantalla()
	{
		puntaje.text = "PUNTAJE " + puntos;
	}
	
	function finJuego()
	{
		if (resultado == true) 
		{
			FlxG.switchState(new WinState());
		}
		else 
		{
			FlxG.switchState(new LoseState());
		}
	}
}