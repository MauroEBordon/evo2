import Data;

class Game extends hxd.App {

	var debug: h2d.Text;
	var worm: Worm;
	public var time: Float;	
	override function init(){
		debug = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		worm = new Worm(450, 500, 550, 500);
		worm.stroke();
		time = 0;
	}
	override function update(dt: Float){
		time += dt;
		worm.update(dt);
		worm.walk(dt);
		debug.text = Std.string(Math.ceil(1/dt))+"\n"+Std.string(Math.floor(time));

	}

	public static var inst : Game;

	static function main(){
		
		inst = new Game();
		Data.load(haxe.Resource.getString("data.cdb"));
		
	}
}
