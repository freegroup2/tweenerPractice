package
{
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
			var container1:Sprite = new Sprite();
			var container2:Sprite = new Sprite();
			var container3:Sprite = new Sprite();
			var container4:Sprite = new Sprite();
			var num1:TextField = new TextField();
			var num2:TextField = new TextField();
			var num3:TextField = new TextField();
			var num4:TextField = new TextField();
			
			stage.addEventListener(MouseEvent.CLICK,tweenersStop);
			ColorShortcuts.init();
			num1.text = "1";
			num2.text = "2";
			num3.text = "3";
			num4.text = "4";
			
			var trapezoid:Shape = new Shape();    
			createShape(container1,trapezoid,100,100,0xFFD700,num1);
			var trapezoid2:Shape = new Shape();    
			createShape(container2,trapezoid2,300,100,0xFFBBFF,num2);
			var trapezoid3:Shape = new Shape();    
			createShape(container3,trapezoid3,100,300,0xAADDEE,num3);
			var trapezoid4:Shape = new Shape();    
			createShape(container4,trapezoid4,300,300,0x556677,num4);
			
			//開始移動第一個方塊	
			Tweener.addTween(container1, {x:200, y:200, time:4, onComplete:rotateTweener, onCompleteParams:[container2, container3, container4]});
		}
		public function createShape(target:Sprite, target2:Shape, pointX:int, pointY:int, color:uint, numText:TextField):void
		{
			target.x = pointX;
			target.y = pointY;
			target.addChildAt(target2,0);
			target.addChildAt(numText,1);
			target2.graphics.lineStyle(10, color, 1, false, LineScaleMode.VERTICAL,CapsStyle.NONE, JointStyle.MITER, 10);
			target2.graphics.lineTo(0, 50);
			target2.graphics.lineTo(120, 50);
			target2.graphics.lineTo(120, 0);
			target2.graphics.lineTo(0, 0); 
			this.addChild(target);
		}
		public function rotateTweener(target:Sprite, target2:Sprite, target3:Sprite):void
		{
			//開始旋轉第二個方塊
			Tweener.addTween(target, {rotation:360, time:3, onComplete:colorChange, onCompleteParams:[target2, target3]});
			//class 概念 那是什麼哇歌？
		}
		public function colorChange(target:Sprite, target2:Sprite):void
		{
			Tweener.addTween(target, {_color:0xffdd33, time:5, onComplete:bounce, onCompleteParams:[target2]});
		}
		public function bounce(target:Sprite):void
		{
			Tweener.addTween(target, {x: 300, transition: "linear", time: 1});
			Tweener.addTween(target, {y: -70, transition: "easeOutQuad", time: 0.5});
			Tweener.addTween(target, {y: 300,	transition: "easeInQuad", time: 0.5, delay: 0.5});		
		}
		public function tweenersStop(event:MouseEvent):void
		{
			Tweener.pauseAllTweens();
		}
	}
}