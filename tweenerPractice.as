package
{
	import caurina.transitions.Tweener;
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class tweenerPractice extends Sprite
	{
		public var targetPos:Point = new Point();
		public var targetPos2:Point = new Point();
		public function tweenerPractice()
		{
			var trapezoid:Shape = new Shape();    
			createShape(trapezoid,100,100,0xFFD700);
			var trapezoid2:Shape = new Shape();    
			createShape(trapezoid2,300,100,0xFFBBFF);
			var trapezoid3:Shape = new Shape();    
			createShape(trapezoid3,100,300,0xAADDEE);		
			
			//開始移動第一個方塊
			targetPos.x = 100;
			targetPos.y = 100;	
			targetPos2.x = 300;
			targetPos2.y = 100;
			Tweener.addTween(trapezoid, {x:targetPos.x, y:targetPos.y, time:5, onComplete:rotateTweener(trapezoid2)});
		}
		public function createShape(target:Shape,pointX:int,pointY:int,color:uint):void
		{
			target.graphics.lineStyle(10, color, 1, false, LineScaleMode.VERTICAL,CapsStyle.NONE, JointStyle.MITER, 10);
			target.graphics.moveTo(pointX, pointY);
			target.graphics.lineTo(pointX, pointY + 50);
			target.graphics.lineTo(pointX + 120, pointY + 50);
			target.graphics.lineTo(pointX + 120, pointY);
			target.graphics.lineTo(pointX, pointY); 
			this.addChild(target);
		}
		public function rotateTweener(target:Shape):void
		{
			//開始旋轉第二個方塊
			Tweener.addTween(target, {x:targetPos2, y:targetPos2, rotation:360, time:10, onStart:fGo()} );
		}
		public function fGo():void
		{
			trace("i am going now");
		}
	}
}