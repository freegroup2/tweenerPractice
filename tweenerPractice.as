package
{
	import flash.display.Sprite;
	import caurina.transitions.Tweener;
	
	import flash.display.CapsStyle;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.Shape;
	import flash.geom.Point;
	
	public class tweenerPractice extends Sprite
	{
		public var targetPos:Point = new Point();
		public var targetPos2:Point = new Point();
		public function tweenerPractice()
		{
			var trapezoid:Shape = new Shape();    
			trapezoid.graphics.lineStyle(10, 0xFFD700, 1, false, LineScaleMode.VERTICAL,CapsStyle.NONE, JointStyle.MITER, 10);
			createShape(trapezoid,100,100);
			var trapezoid2:Shape = new Shape();    
			trapezoid2.graphics.lineStyle(10, 0xFFBBFF, 1, false, LineScaleMode.VERTICAL,CapsStyle.NONE, JointStyle.MITER, 10);
			createShape(trapezoid2,300,100);
			var trapezoid3:Shape = new Shape();    
			trapezoid3.graphics.lineStyle(10, 0xAADDEE, 1, false, LineScaleMode.VERTICAL,CapsStyle.NONE, JointStyle.MITER, 10);
			createShape(trapezoid3,100,300);			
			/////////////開始移動第一個方塊////////////////////////////////////////
			targetPos.x = 100;
			targetPos.y = 100;			
			Tweener.addTween(trapezoid, {x:targetPos.x, y:targetPos.y, time:5} );
			////////////開始旋轉第二個方塊////////////////////////////////////////
			targetPos2.x = 300;
			targetPos2.y = 100;
			Tweener.addTween(trapezoid2, {x:targetPos2, y:targetPos2, rotation:360, time:10, delay:5} );
		}
		public function createShape(target:Object,pointX:int,pointY:int):void
		{
			target.graphics.moveTo(pointX, pointY);
			target.graphics.lineTo(pointX, pointY + 50);
			target.graphics.lineTo(pointX + 120, pointY + 50);
			target.graphics.lineTo(pointX + 120, pointY);
			target.graphics.lineTo(pointX, pointY); 
			Object(this).addChild(target);
		}
	}
}