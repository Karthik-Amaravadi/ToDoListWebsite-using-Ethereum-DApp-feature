// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract todolist{
    struct List{
        bytes32 item;
        uint256 priority;
    }
    List[] Lists;
    mapping(address => List[]) private Users;
    
    function add_items(bytes32 _item,uint256 _priority) external{
        Users[msg.sender].push(List(_item,_priority));
        Lists.push(List(_item,_priority));
    }   
    
    function prioritize_items(bytes32 _item,uint256 _priority) external{
        for(uint i=0;i<Users[msg.sender].length;i++){
            if(Users[msg.sender][i].item==_item){
                Users[msg.sender][i].priority = _priority;
                break;
            }
        }
    }

    function delete_items(uint _index) external {
       Users[msg.sender][_index] = Users[msg.sender][Users[msg.sender].length-1];
       Users[msg.sender].pop();

    }

    function display_items() external view returns(List[] memory){
        List[] memory l = Users[msg.sender];
        return l;
    }
    
}