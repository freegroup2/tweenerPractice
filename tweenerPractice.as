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
		
	public class tweenerPractice extends Sprite
	{
		public function tweenerPractice()
		{
			//分別宣告了container用來包住shape 和 texdfield
			//shape分別命名為 trapezoid 1234
			//textfield分別命名為num 1234
			var container1:Sprite = new Sprite();
			var container2:Sprite = new Sprite();
			var container3:Sprite = new Sprite();
			var container4:Sprite = new Sprite();
			var num1:TextField = new TextField();
			var num2:TextField = new TextField();
			var num3:TextField = new TextField();
			var num4:TextField = new TextField();
			var trapezoid:Shape = new Shape();    
			var trapezoid2:Shape = new Shape();    
			var trapezoid3:Shape = new Shape();    
			var trapezoid4:Shape = new Shape();    
			
			//給 button一個listener 並且負責tweenerStop的部分
			stage.addEventListener(MouseEvent.CLICK,tweenersStop);
			//根據Tweener的文件 要變色要加入下面這一條
			ColorShortcuts.init();
			//讓最主要的顯示元件container分別加入了shape 並且把container給了位置 和shape的顏色 及上面標示number及內容
			createShape(container1,trapezoid,100,100,0xFFD700,num1,"1");
			createShape(container2,trapezoid2,300,100,0xFFBBFF,num2,"2");
			createShape(container3,trapezoid3,100,300,0xAADDEE,num3,"3");
			createShape(container4,trapezoid4,300,300,0x556677,num4,"4");
			//開始移動第一個方塊,並且依序執行四個tweener	
			Tweener.addTween(container1, {x:200, y:200, time:4, onComplete:rotateTweener, onCompleteParams:[container2, container3, container4]});
		}
		public function createShape(target:Sprite, target2:Shape, pointX:int, pointY:int, color:uint, numText:TextField, number:String):void
		{
			target.x = pointX;
			target.y = pointY;
			numText.text = number;
			target.addChildAt(target2,0);
			target.addChildAt(numText,1);
			//再使用addChildAt時 0號索引要在最上面？
			//指定lineStyle 及lineTo去畫出長方形
			target2.graphics.lineStyle(10, color, 1, false, LineScaleMode.VERTICAL,CapsStyle.NONE, JointStyle.MITER, 10);
			target2.graphics.lineTo(0, 50);
			target2.graphics.lineTo(120, 50);
			target2.graphics.lineTo(120, 0);
			target2.graphics.lineTo(0, 0); 
			this.addChild(target);
		}
		public function rotateTweener(target:Sprite, target2:Sprite, target3:Sprite):void
		{
			//開始旋轉第二個框框
			Tweener.addTween(target, {rotation:360, time:3, onComplete:colorChange, onCompleteParams:[target2, target3]});
		}
		public function colorChange(target:Sprite, target2:Sprite):void
		{
			//開始變色第三個框框
			Tweener.addTween(target, {_color:0xffdd33, time:5, onComplete:bounce, onCompleteParams:[target2]});
		}
		public function bounce(target:Sprite):void
		{
			//開始彈跳第四個框框
			Tweener.addTween(target, {x: 300, transition: "linear", time: 1});
			Tweener.addTween(target, {y: -70, transition: "easeOutQuad", time: 0.5});
			Tweener.addTween(target, {y: 300,	transition: "easeInQuad", time: 0.5, delay: 0.5});		
		}
		public function tweenersStop(event:MouseEvent):void
		{
			//暫停所有的Tweener的動作
			Tweener.pauseAllTweens();
		}
	}
}