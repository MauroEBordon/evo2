import Data;

class Game extends hxd.App {

	var fps: h2d.Text;
	var worm: Worm;
	
	override function init(){
		fps = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		worm = new Worm(100, 100, 300, 300);
		worm.stroke();
	}
	override function update(dt: Float){
		fps.text = Std.string(Math.ceil(1/dt));
		worm.update();
	}

	public static var inst : Game;

	static function main(){
		
		inst = new Game();
		Data.load(haxe.Resource.getString("data.cdb"));

	}
}