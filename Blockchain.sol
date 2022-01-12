// SPDX-License-Identifier: GPL-3.
pragma solidity >=0.7.0 <0.9.0;


contract Blockchain {
    
	
    function getBlockDifficulty() public view returns(uint256) {
        
        return block.difficulty;
    }
    
	
    function getBlockTimestamp() public view returns(uint256) {
        
        return block.timestamp;   ;
    }
    
	
    function getBlockNumber() public view returns(uint256) {
        
        return block.number;
    }
    
	
    function getBlockHash() public view returns(bytes32) {
        
        return blockhash(block.number + 1);
    }
    
	
    function getBlockMiner() public view returns(address payable) {
        
        return block.coinbase;
    }
    
    function getBlockBaseFee() public view returns(uint256) {
        
        return block.basefee;
    }
    
	
	function getBlockChainid() public view returns(uint256) {
        
        return block.chainid;
    }
	
	
	function getBlockGasLimit() public view returns(uint256) {
        
        return block.gaslimit;
    }
    
    
    function geRemainingGas() public view returns(uint256) {
        
        return gasleft();
    }
    
    
    function getMessageData() public pure returns(bytes calldata) {
        
        return msg.data;
    }
     
    
    function getMessageSender() public view returns(address) {
        
        return msg.sender;
    }
    
    
    function getMessageSign() public pure returns(bytes4) {
        
        return msg.sig;
    }  
    
    
    function getMsgValue() public payable returns(uint256) {
        
        return msg.value;
    }
    
    
    function getGasPrice() public view returns(uint256) {
        
        return tx.gasprice;
    }
    
	
    function getTxSender() public view returns(address) {
        
        return tx.origin;
    }
    
    
    function abiEncPack_v1(uint256 inputA) public pure returns(bytes memory) {
        
        return abi.encodePacked(inputA);
    }
    
    
    function abiEncPack_v2(uint256 inputA, uint256 inputB) public pure returns(bytes memory) {
        
        return abi.encodePacked(inputA, inputB);
    }
    
    	
    function hashByKeccack256(string memory plainTex) public pure returns(bytes32) {
        
		
        return bytes32(keccak256(abi.encodePacked(plainTex)));
    }
    
    
    function hashBySha256(string memory plainTex) public pure returns(bytes32) {
        
        return bytes32(sha256(abi.encodePacked(plainTex)));
    }
    
}