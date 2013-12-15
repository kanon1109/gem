package data 
{
/**
 * ...钻石数据
 * @author Kanon
 */
public class GemVo 
{
    /**钻石类型*/
    public var color:int;
    /**x坐标位置*/
    public var x:Number;
    /**y坐标位置*/
    public var y:Number;
    /**纵向向量*/
    public var vy:Number = 0;
    /**重力*/
    public var g:Number = 0;
    /**宽度*/
    public var width:Number;
    /**高度*/
    public var height:Number;
    /**行数*/
    public var row:int;
    /**列表数*/
    public var column:int;
    /**y坐标移动范围 超过范围则停止运动*/
    public var rangeY:Number = 0;
    /**用户数据*/
    public var userData:*;
	/**是否归位*/
    public var isInPosition:Boolean;
	
	/**
	 * 转行字符串
	 * @return		返回行列数据
	 */
	public function toString():String
	{
		return "row：" + this.row + " column：" + this.column;
	}
}
}