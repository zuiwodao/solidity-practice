pragma solidity ^0.4.24;
/*
第一步create_crowdfunding,设置接收者地址和金额。
第二步contribute,设置Newaddress = 捐赠者地址和_recipientId = 1。msg.value填上相应金额。
第三步Isconpelte,查看结果
*/
 
contract crowd_funding{
    
    //捐赠者对象
    struct Contributor{
        address contributor_address; //捐赠者地址
        uint contributor_money; //捐赠金额
    }
    
    //接收者对象
    struct Recipient{
        address recipient_address; //接收者地址
        uint goal; //筹资金额目标
        uint amount; //当前筹资金额
        uint contributor_amount; //捐赠者数量
        mapping(uint => Contributor) map; //通过id与捐赠者关联
    }
    
    uint public recipientId; //接受者id
    mapping(uint => Recipient) recipient_map; //通过id将接受者信息关联
    
    // 发起一个众筹事件
    function create_crowdfunding(address _address,uint _goal) public {
        // 将接受者id加1
        recipientId++;
        // 创建接受者对象，并通过id与其绑定
        recipient_map[recipientId] = Recipient(_address,_goal,0,0);
        
    }
    
    //发起捐赠    
    function contribute(address Newaddress,uint _recipientId) public  payable{
        // 通过id获取接受者对象
        Recipient storage _recipient = recipient_map[_recipientId];
        // 当前接受者金额加上获赠的金额
        _recipient.amount += msg.value;
        //捐赠人数加1
        _recipient.contributor_amount++;
        // 将接受者id与捐赠者绑定在一起
        _recipient.map[ _recipient.contributor_amount] = Contributor(Newaddress,msg.value);
        
    }
    
    // 判断众筹任务是否完成
    function Iscompelte(uint _recipientId)public returns(bool){
         // 通过id获取接受者对象
        Recipient storage _recipient = recipient_map[_recipientId];
        // 判断筹集资金是否达到与其目标
        if(_recipient.amount >= _recipient.goal){
            //将众筹到的资金转移到接受者合约地址
            _recipient.recipient_address.transfer(_recipient.amount);
            return true;
        }
            return false;
        
    }
  
    
}