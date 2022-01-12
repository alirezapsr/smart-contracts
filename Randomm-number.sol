//SPDX-Licence-Identifier: GPL-3.int208

pragma solidity >=0.7.0 <0.9.0;

import "./Blockchain.sol";

contract RandommneNumber {
    
    Blockchain public bc = new Blockchain();
    
    constructor() {
        
    }
    
    
    function getRandInt(uint8 upTo) public view returns(uint256 randInt)  {
        
        uint256 _seed = bc.getBlockTimestamp();
        
        randInt = uint256(keccak256(abi.encodePacked(bc.getBlockHash(), _seed))) % (upTo + 1);
    }  
}