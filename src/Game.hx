import Data;

class Game extends hxd.App {
	public static var inst : Game;
	var debug: h2d.Text;
	var worm: Worm;
	public var time: Float;	

	override function init(){
		debug = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		worm = new Worm();
		worm.stroke();
		time = 0;
	}

	function getText(dt: Float){
		var ans = Std.string(Math.ceil(1/dt))+"\n";
		ans += Std.string(Math.floor(time))+"\n";
		ans += Std.string(worm.velocity.x).substr(0, 5)+" "+Std.string(worm.velocity.y).substr(0, 5)+"\n";
		return ans;
	}

	override function update(dt: Float){
		time += dt;
		worm.update(dt);
		worm.walk(dt);
		debug.text = getText(dt);

	}

	static function main(){
		inst = new Game();
		Data.load(haxe.Resource.getString("data.cdb"));
		
	}
}
