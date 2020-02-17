import Data;

class Game extends hxd.App {

	var fps: h2d.Text;
	var worm: Worm;
	var vel: Int;
	
	override function init(){
		fps = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		worm = new Worm(200, 100, 300, 300);
		worm.stroke();
		vel = -1;

	}
	override function update(dt: Float){
		
		worm.update(dt);
		worm.walk(dt);
		fps.text = Std.string(Math.ceil(1/dt));

	}

	public static var inst : Game;

	static function main(){
		
		inst = new Game();
		Data.load(haxe.Resource.getString("data.cdb"));
		
	}
}
