import h3d.shader.pbr.Slides.DebugMode;
import Data;

class Game extends hxd.App {
	var square: h2d.Bitmap;
	var fps: h2d.Text;
	override function init(){

		var tile= h2d.Tile.fromColor(0x44FF90, 100, 100);
		fps = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		square = new h2d.Bitmap(tile, s2d);

		square.x = s2d.width * 0.5;
		square.y = s2d.height * 0.5;
		square.tile.dx = -50;
		square.tile.dy = -50;
	}
	override function update(dt: Float){
		square.rotation += Math.PI / dt;
		fps.text = Std.string(Math.ceil(1/dt));
	}

	public static var inst : Game;

	static function main(){
		
		inst = new Game();
		Data.load(haxe.Resource.getString("data.cdb"));

	}
}