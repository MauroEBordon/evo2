class Worm extends Entity{
	var game : Game;
	public var head: h2d.Graphics;
	public var tail: h2d.Graphics;
	public var line: h2d.Graphics;
	public var velocity: h3d.Vector;
	public var acceleration: h3d.Vector;
	public var reach: Float;
	public var dna: DNA;
	public var fitness: Float;

	public var width: Int;
	public var height: Int;
	public var size: Float;

	var turn: Int;
	var step_time: Float;
	var step_time_limit: Float;
	var tick_time: Float;
	var global_tick: Float;
	var maxvel: Float;
	public function new(hx=475, hy=500, tx=525, ty=500, wid=50, hei=15,
						rch=85, mvel=1.20, stptime=1){
		super();
		game = Game.inst;
		head = new h2d.Graphics(game.s2d);
		tail = new h2d.Graphics(game.s2d);
		line = new h2d.Graphics(game.s2d);
		head.x = hx;
		head.y = hy;
		tail.x = tx;
		tail.y = ty;
		width = wid;
		height = hei;
		x = Math.floor((head.x + tail.x)/2);
		y = Math.floor((head.y + tail.y)/2);
		rotation = Math.atan2(tail.y - head.y, tail.x - head.x);
		size = Math.sqrt(Math.pow(head.x-tail.x, 2) + Math.pow(head.y-tail.y,2));
		velocity = new h3d.Vector(0,0);
		acceleration = new h3d.Vector();
		step_time = 0;
		tick_time = 0;
		global_tick = 2*stptime;
		turn = 1;
		reach = rch;
		step_time_limit = stptime;
		maxvel = mvel;
	}

	public function stroke() {
		head.beginFill(0x2245DDFF);
		head.drawCircle(0, 0, height);
		head.endFill();
		tail.beginFill(0x2245DDFF);
		tail.drawCircle(0, 0, height);
		tail.endFill();

	}

	public function update(dt: Float) {
		line.clear();
		line.x = head.x;
		line.y = head.y;
		x = Math.floor((head.x + tail.x)/2);
		y = Math.floor((head.y + tail.y)/2);
		rotation = Math.atan2(tail.y - head.y, tail.x - head.x);		
		line.rotation = rotation;
		size = Math.sqrt(Math.pow(tail.x-head.x, 2) + Math.pow(head.y-tail.y,2));		
		line.beginFill(0x2245DDFF);
		line.drawRect(0,-height, size, 2*height);
		line.endFill();
		if (global_tick < tick_time){
			velocity.x = Math.random() * maxvel*2 - maxvel;
			velocity.y = Math.random() * maxvel*2 - maxvel;
			tick_time = 0;
		}
	}

	public function walk(dt: Float) {

		step_time += dt;
		tick_time += dt;

		if(step_time_limit < step_time){
			step_time = 0;
			turn ^= 1;
		}
		if(turn==1){
			step(head);
		}
		else{
			step(tail);
		}
	}
	function step(part: h2d.Graphics){
		if(reach < Math.abs(size)){
			tail.x = head.x;
			tail.y = head.y;
		}
		part.x += velocity.x;
		part.y += velocity.y;

	}
}