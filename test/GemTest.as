package  
{
import com.greensock.TweenMax;
import com.greensock.easing.Sine;
import data.GemVo;
import events.GemEvent;
import flash.display.Sprite;
import flash.events.Event;
import utils.Random;
/**
 * ...宝石迷阵测试类
 * @author Kanon
 */
public class GemTest extends Sprite 
{
    private var gem:Gem;
    private var colorAry:Array = [null, 0xFF00FF, 0xFFCC00, 0x0000FF, 
										0x55FF33, /*0x55CCFF, 0xC88CC0*/];
	private var rect:Sprite;
	private var selectedGVo:GemVo;
    public function GemTest() 
    {
		this.rect = new Rect();
        this.gem = new Gem(this.colorAry.length - 1, stage, 8, 8, 5, 5, 200, 60, 50, 50);
        this.gem.addEventListener(GemEvent.SELECT, selectGemHandler);
        this.gem.addEventListener(GemEvent.REMOVE, removeGemHandler);
        this.gem.addEventListener(GemEvent.ADD_GEM, addGemHandler);
		this.initDrawGem();
		this.addEventListener(Event.ENTER_FRAME, loop);
    }
    
    private function addGemHandler(event:GemEvent):void 
    {
        var gVo:GemVo = event.gVo as GemVo;
        gVo.userData = new Sprite();
        Sprite(gVo.userData).graphics.beginFill(this.colorAry[gVo.colorType]);
        Sprite(gVo.userData).graphics.drawRoundRect(0, 0, 50, 50, 5, 5);
        Sprite(gVo.userData).graphics.endFill();
        Sprite(gVo.userData).x = gVo.x;
        Sprite(gVo.userData).y = gVo.y;
        this.addChild(Sprite(gVo.userData));
    }
	
	/**
     * 绘制宝石
     */
    private function initDrawGem():void 
    {
        var gVo:GemVo;
		for each (gVo in this.gem.gemDict) 
		{
			gVo.userData = new Sprite();
			Sprite(gVo.userData).graphics.beginFill(this.colorAry[gVo.colorType]);
			Sprite(gVo.userData).graphics.drawRoundRect(0, 0, 50, 50, 5, 5);
			Sprite(gVo.userData).graphics.endFill();
			Sprite(gVo.userData).x = gVo.x;
			Sprite(gVo.userData).y = gVo.y;
			this.addChild(Sprite(gVo.userData));
		}
    }
	
	//选中宝石或者取消选择
	private function selectGemHandler(event:GemEvent):void 
	{
		var gVo:GemVo = event.gVo as GemVo;
		if (gVo)
		{
			this.selectedGVo = gVo;
			this.rect.x = this.selectedGVo.x;
			this.rect.y = this.selectedGVo.y;
			this.addChild(this.rect);
		}
		else
		{
			if (this.rect.parent)
				this.rect.parent.removeChild(this.rect);
			this.selectedGVo = null;
		}
	}
    
	private function removeGemHandler(event:GemEvent):void 
	{
		var gVo:GemVo = event.gVo as GemVo;
		if (gVo.userData && gVo.userData is Sprite)
		{
            var posX:Number = gVo.x + gVo.width * .5;
            var posY:Number = gVo.y + gVo.height * .5;
			TweenMax.to(gVo.userData, .2, { scaleX:0, scaleY:0, 
                                            x:posX, y:posY,
                                            ease:Sine.easeOut, 
                                            onComplete:function ():void
                                            {
                                                if (Sprite(gVo.userData).parent)
                                                    Sprite(gVo.userData).parent.removeChild(Sprite(gVo.userData));
                                            }} );
		}
	}
    
	/**
	 * 渲染
	 */
	public function render():void
	{
		var gVo:GemVo;
		for each (gVo in this.gem.gemDict) 
		{
			if (gVo.userData && gVo.userData is Sprite)
			{
				Sprite(gVo.userData).x = gVo.x;
				Sprite(gVo.userData).y = gVo.y;
			}
		}
		if (this.selectedGVo)
		{
			this.rect.x = this.selectedGVo.x;
			this.rect.y = this.selectedGVo.y;
		}
	}
    
	private function loop(event:Event):void 
	{
		this.gem.update();
		this.render();
	}
}
}