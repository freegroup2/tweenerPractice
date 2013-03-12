package
{
	// import 各項類別 包括 shape texfield Tweener Sprite MouseEvent
	import caurina.transitions.Tweener;
	import caurina.transitions.properties.ColorShortcuts;
	import fl.transitions.Tween;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
		
	public class TweenerPractice extends Sprite
	{
		//分別宣告了container用來包住shape 和 texdfield
		//shape分別命名為 trapezoid 1234
		//textfield分別命名為num 1234
		public var container1:Sprite;
		public var container2:Sprite;
		public var container3:Sprite;
		public var container4:Sprite;
		
		public function TweenerPractice()
		{
			container1 = new Sprite();
			container2 = new Sprite();
			container3 = new Sprite();
			container4 = new Sprite();
			//給 button一個listener 並且負責tweenerStop的部分
			stage.addEventListener(MouseEvent.CLICK,tweenersStop);
			//根據Tweener的文件 要變色要加入下面這一條
			ColorShortcuts.init();
			//讓最主要的顯示元件container分別加入了shape 並且把container給了位置 和shape的顏色 及上面標示number及內容
			createShape(container1,100,100,0xFFD700,"1");
			createShape(container2,300,100,0xFFBBFF,"2");
			createShape(container3,100,300,0xAADDEE,"3");
			createShape(container4,300,300,0x556677,"4");
			//開始移動第一個方塊,並且依序執行四個tweener	
			Tweener.addTween(container1, {x:200, y:200, time:4, onComplete:rotateTweener});
		}
		public function createShape(target:Sprite, pointX:int, pointY:int, color:uint, number:String):void
		{
			var num:TextField = new TextField();
			var trapezoid:Shape = new Shape();    
			target.x = pointX;
			target.y = pointY;
			num.text = number;
			target.addChild(trapezoid);
			target.addChild(num);
			//再使用addChildAt時 0號索引要在最上面？
			//指定lineStyle 及lineTo去畫出長方形
			trapezoid.graphics.lineStyle(10, color, 1, false, LineScaleMode.VERTICAL,CapsStyle.NONE, JointStyle.MITER, 10);
			trapezoid.graphics.lineTo(0, 50);
			trapezoid.graphics.lineTo(120, 50);
			trapezoid.graphics.lineTo(120, 0);
			trapezoid.graphics.lineTo(0, 0); 
			this.addChild(target);
		}
		public function rotateTweener():void
		{
			//開始旋轉第二個框框
			Tweener.addTween(container2, {rotation:360, time:3, onComplete:colorChange});
		}
		public function colorChange():void
		{
			//開始變色第三個框框
			Tweener.addTween(container3, {_color:0xffdd33, time:5, onComplete:bounce});
		}
		public function bounce():void
		{
			//開始彈跳第四個框框
			Tweener.addTween(container4, {x: 300, transition: "linear", time: 1});
			Tweener.addTween(container4, {y: -70, transition: "easeOutQuad", time: 0.5});
			Tweener.addTween(container4, {y: 300,	transition: "easeInQuad", time: 0.5, delay: 0.5});		
		}
		public function tweenersStop(event:MouseEvent):void
		{
			//暫停所有的Tweener的動作
			Tweener.pauseAllTweens();
		}
	}
}