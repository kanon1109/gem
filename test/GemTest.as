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
        this.gem = new Gem(7, stage, 8, 8, 5, 5, 200, 60, 50, 50);
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
                gVo.userData = new Sprite();
                Sprite(gVo.userData).graphics.beginFill(this.colorAry[gVo.colorType]);
                Sprite(gVo.userData).graphics.drawRoundRect(0, 0, 50, 50, 5, 5);
                Sprite(gVo.userData).graphics.endFill();
                Sprite(gVo.userData).x = gVo.x;
                Sprite(gVo.userData).y = gVo.y;
                this.addChild(Sprite(gVo.userData));
            }
        }
    }
    
}
}