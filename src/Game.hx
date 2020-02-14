class Game extends hxd.App {
	
	override function init(){

	}
	override function update(dt: Float){

	}

	public static var inst : Game;

	static function main(){
		Data.load(haxe.Resource.getString("data.cdb"));
		inst = new Game();
	}
}