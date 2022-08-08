// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//ERC 20 is a standard for creating fungible tokens...meaning each erc20 token ever created is the same
contract Web3Dev is ERC20 {
    //this contract once deployed automatically mints 10,000 Web3 takens and puts them in the account of the person who deployed this contact
    
    uint time_now;
    //this variable is used to record the time of the contract deployment
    constructor() ERC20("Web3Dev", "Web3") {
        _mint(msg.sender, 10000 * 10 ** decimals());
        time_now = block.timestamp;//this gives the time when this smart contarctw was created and the current block was added to the network
    }


   //I wanted to come up with a function where the minter can send bonus tokens to accounts 
    function bonus_special(address to,uint amount ) public virtual returns (bool){
       
       uint passed_time = 1 minutes;
       //bonus can be sent to only those accounts that already have these tokens in them and at a time greater than 1 minute
       //of deploying the contract
       //Ideally it should be more than 1 min...obviously no company gives bonuses just after a minute of joining ;)
       //I used 1 minute for testing purposes
       if(block.timestamp > time_now + passed_time && balanceOf(to)>1){
              _transfer(msg.sender, to,amount );//sends the bonus amount the msg.sender decides to the 'to' address
       }
      return true;


    }
    
    
}
