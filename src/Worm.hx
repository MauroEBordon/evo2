import h2d.Bitmap;

class Worm extends h2d.Object{
	var game : Game;
	public var head: h2d.Graphics;
	public var tail: h2d.Graphics;
	public var velocity: h3d.Vector;
	public var acceleration: h3d.Vector;
	public var reach: Float;
	public var dna: DNA;
	public var fitness: Float;

	public var width: Int;
	public var height: Int;
	public var size: Float;
	
	public function new(hx=450, hy=450, tx=550, ty=550, wid=100, hei=30){
		super();
		game = Game.inst;
		head = new h2d.Graphics(game.s2d);
		tail = new h2d.Graphics(game.s2d);
		head.x = hx;
		head.y = hy;
		tail.x = tx;
		tail.y = ty;
		width = wid;
		height = hei;
		x = Math.floor((head.x + tail.x)/2);
		y = Math.floor((head.y + tail.y)/2);
		rotation = Math.atan2(head.y - tail.y, head.x - tail.x);
		velocity = new h3d.Vector();
		acceleration = new h3d.Vector();
		size = Math.sqrt(Math.pow(tail.x-head.x, 2) + Math.pow(tail.y-head.y,2))/2;

	}

	public function stroke(){
		head.beginFill(0x2245DDFF);
		head.drawCircle(0, 0, height);
		head.endFill();
		tail.beginFill(0x2245DDFF);
		tail.drawCircle(0, 0, height);
		tail.endFill();
	}

	public function update() {

	}
}