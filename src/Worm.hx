class Worm {
	var game : Game;
	public var head: h3d.Vector;
	public var tail: h3d.Vector;
	public var velocity: h3d.Vector;
	public var acceleration: h3d.Vector;
	public var reach: Float;
	public var dna: DNA;
	public var fitness: Float;

	public var width = 100;
	public var height = 30;

	var body: h2d.Graphics;
	var p1: h2d.Graphics;
	var p2: h2d.Graphics;

	public function new(head: h3d.Vector, tail: h3d.Vector){
		game = Game.inst;
		this.head = head;
		this.tail = tail;
		velocity = new h3d.Vector();
		acceleration = new h3d.Vector();
		reach = 20;
		body = new h2d.Graphics(game.s2d);
		p1 = new h2d.Graphics(game.s2d);
		p2 = new h2d.Graphics(game.s2d);
	}

	public function draw(){
		var size = this.head.distance(this.tail)/2;
		var k = 10;
	
		this.body.beginFill(0x2245DDFF);
		for( i in 0...k+1 ) {
		  var a = Math.PI * i / k - Math.PI / 2;
		  this.body.lineTo(size + this.height * Math.cos(a), this.height * Math.sin(a));
		}
		for( i in 0...k+1 ) {
		  var a = Math.PI * i / k + Math.PI / 2;
		  this.body.lineTo(-size + this.height * Math.cos(a), this.height * Math.sin(a));
		}
		this.body.endFill();
		this.body.x = this.body.tile.dx = Math.floor((this.head.x + this.tail.x)/2);
		this.body.y = this.body.tile.dy =  Math.floor((this.head.y + this.tail.y)/2);
		this.body.rotation = Math.atan2(this.head.y - this.tail.y, this.head.x - this.tail.x);

		this.p1.beginFill(0x00FF0000);
		this.p1.drawRect(this.head.x-1, this.head.y-1, 3, 3);
		this.p1.endFill();
		this.p2.beginFill(0x00FF0000);
		this.p2.drawRect(this.tail.x-1, this.tail.y-1, 3, 3);
		this.p2.endFill();
		
	}
}