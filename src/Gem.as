package  
{
import data.GemVo;
import flash.display.Stage;
import flash.events.MouseEvent;
/**
 * ...宝石迷阵算法
 * @author Kanon
 */
public class Gem 
{
    //行数
    private var rows:uint;
    //列数
    private var columns:uint;
    //宝石列表
    private var _gemList:Array;
    //横向间隔
    private var gapH:Number;
    //纵向间隔
    private var gapV:Number;
    //舞台
    private var stage:Stage;
    
    private var 
    /**
     * 
     * @param	stage       舞台用于点击
     * @param	rows        行数
     * @param	columns     列数
     * @param	gapH        横向间隔
     * @param	gapV        纵向间隔
     */
    public function Gem(stage:Stage, rows:uint, columns:uint, gapH:Number, gapV:Number) 
    {
        this.stage = stage;
        this.rows = rows;
        this.columns = columns;
        this.gapH = gapH;
        this.gapV = gapV;
        this.initData();
        this.initEvent();
    }
    
    /**
     * 初始化事件
     */
    private function initEvent():void 
    {
        this.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
    }
    
    private function mouseDownHandler(event:MouseEvent):void 
    {
        
    }
    
    /**
     * 初始化数据
     */
    private function initData():void
    {
        this._gemList = [];
        var gVo:GemVo;
        for (var row:int = 0; row < this.rows; row += 1) 
        {
            this._gemList[row] = [];
            for (var column:int = 0; column < this.columns; column += 1) 
            {
                gVo = new GemVo();
                gVo.x = row * this.gapH;
                gVo.y = column * this.gapV;
                this._gemList[row][column] = gVo;
            }
        }
    }
    
    /**
     * 销毁
     */
    public function destroy():void
    {
        this.stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        this.stage = null;
        this._gemList = null;
    }
    
    /**
     * 宝石列表
     */
    public function get gemList():Array { return _gemList; };
}
}