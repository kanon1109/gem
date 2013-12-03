package events 
{
import data.GemVo;
import flash.events.Event;
/**
 * ...宝石事件
 * @author Kanon
 */
public class GemEvent extends Event 
{
	//选中事件
	public static const SELECT:String = "select";
	//被销毁事件
	public static const REMOVE:String = "remove";
    /*添加宝石事件*/
	public static const ADD_GEM:String = "addGem";
	//选中的宝石数据
	public var gVo:GemVo;
	public function GemEvent(type:String, gVo:GemVo = null, bubbles:Boolean=false, cancelable:Boolean=false) 
	{ 
		this.gVo = gVo;
		super(type, bubbles, cancelable);
	} 
	
	public override function clone():Event 
	{ 
		return new GemEvent(type, gVo, bubbles, cancelable);
	} 
	
	public override function toString():String 
	{ 
		return formatToString("GemEvent", "type", "bubbles", "cancelable", "eventPhase"); 
	}
	
}
}