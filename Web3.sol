// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//ERC 20 is a standard for creating fungible tokens...meaning each erc20 token ever created is the same
contract Web3Dev is ERC20 {
    //this contract once deployed automatically mints 10,000 Web3 takens and puts them in the account of the person who deployed this contact
    
    uint time_now;
    constructor() ERC20("Web3Dev", "Web3") {
        _mint(msg.sender, 10000 * 10 ** decimals());
        time_now = block.timestamp;
    }
   
    function bonus_special(address to,uint amount ) public virtual returns (bool){
       
       uint passed_time = 1 minutes;
       if(block.timestamp > time_now + passed_time && balanceOf(to)>1){
              _transfer(msg.sender, to,amount );
       }
      return true;


    }
    
    
}