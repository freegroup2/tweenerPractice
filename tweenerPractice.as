package
{
	import caurina.transitions.Tweener;
	import caurina.transitions.properties.ColorShortcuts;
	ColorShortcuts.init();
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	
	
	public class tweenerPractice extends Sprite
	{
		public function tweenerPractice()
		{
			var num1:TextField = new TextField();
			var num2:TextField = new TextField();
			var num3:TextField = new TextField();
			var container1:Sprite = new Sprite();
			var container2:Sprite = new Sprite();
			var container3:Sprite = new Sprite();

			var trapezoid:Shape = new Shape();    
			createShape(container1,trapezoid,100,100,0xFFD700,num1);
			var trapezoid2:Shape = new Shape();    
			createShape(container2,trapezoid2,300,100,0xFFBBFF,num2);
			var trapezoid3:Shape = new Shape();    
			createShape(container3,trapezoid3,100,300,0xAADDEE,num3);
			
			//開始移動第一個方塊	
			Tweener.addTween(trapezoid, {x:100, y:100, time:5, onComplete:rotateTweener, onCompleteParams:[trapezoid2]});
			Tweener.addTween(trapezoid3, {_color:0xffdd33, time:10, delay:15});
		}
		public function createShape(target:Sprite, target2:Shape, pointX:int, pointY:int, color:uint, numText:TextField):void
		{
			target2.graphics.lineStyle(10, color, 1, false, LineScaleMode.VERTICAL,CapsStyle.NONE, JointStyle.MITER, 10);
			target2.graphics.moveTo(pointX, pointY);
			target2.graphics.lineTo(pointX, pointY + 50);
			target2.graphics.lineTo(pointX + 120, pointY + 50);
			target2.graphics.lineTo(pointX + 120, pointY);
			target2.graphics.lineTo(pointX, pointY); 
			target.addChildAt(target2,0);
			target.addChildAt(numText,1);
			this.addChild(target);
		}
		public function rotateTweener(target:Shape):void
		{
			//開始旋轉第二個方塊
			Tweener.addTween(target, {x:-300, y:-100, rotation:360, time:10});
			//, onComplete:colorChange, onCompleteParams:[root.trapezoid3]}
		}
		public function colorChange(target:Shape):void
		{

		}
	}
}