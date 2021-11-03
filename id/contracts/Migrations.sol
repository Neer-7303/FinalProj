// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
  
  uint public last_completed_migration;
  address public ContractOwner;
  
  constructor() public {
        ContractOwner = msg.sender;
    }
  

    struct UserInfo{
		string FullName;
		string DocNum;
		string IpfsHash;
    }
  mapping(address => UserInfo[]) UserMap;
  function AddUser(address UserAddress,string memory FullName,string memory DocNum,string memory IpfsHash) public {
        UserMap[UserAddress].push(UserInfo(FullName,DocNum,IpfsHash));
        
    } 
  
  
  function setCompleted(uint completed) public {
    last_completed_migration = completed;
  } 


}
