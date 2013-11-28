package  
{
import data.GemVo;
import flash.display.Sprite;
import utils.Random;
/**
 * ...宝石迷阵测试类
 * @author Kanon
 */
public class GemTest extends Sprite 
{
    private var gem:Gem;
    private var colorAry:Array = [null, 0xFF00FF, 0xFFCC00, 0x0000FF, 0x55FF33, 0x55CCFF];
    private var spt:Sprite;
    public function GemTest() 
    {
        this.gem = new Gem(stage, 8, 8, 60, 60);
        this.spt = new Sprite();
        this.spt.x = 200;
        this.spt.y = 60;
        this.addChild(this.spt);
        this.initDrawGem(this.gem.gemList);
    }
    
    /**
     * 绘制宝石
     * @param	gemList     宝石
     */
    private function initDrawGem(gemList:Array):void 
    {
        var length:int = gemList.length;
        var arr:Array;
        var gVo:GemVo;
        for (var i:int = 0; i < length; i += 1) 
        {
            arr = gemList[i];
            var len:int = arr.length;
            for (var j:int = 0; j < len; j += 1) 
            {
                gVo = gemList[i][j];
                gVo.colorType = Random.randint(1, 5);
                gVo.userData = new Sprite();
                Sprite(gVo.userData).graphics.beginFill(this.colorAry[gVo.colorType]);
                Sprite(gVo.userData).graphics.drawRoundRect(-25, -25, 50, 50, 5, 5);
                Sprite(gVo.userData).graphics.endFill();
                Sprite(gVo.userData).x = gVo.x;
                Sprite(gVo.userData).y = gVo.y;
                this.spt.addChild(Sprite(gVo.userData));
            }
        }
    }
    
}
}