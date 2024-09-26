// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract practice {
    uint practiceNo;
    // uint[] collectionOfFavNo;  //this is how we declare array or list here.length;

    //Now if we also want to know that which FavNo is of which person. To do this, we can create a struct data structure where we can store the favNo for each person.
    struct Person {
        uint256 favNo;
        string name;
    }
    
    Person public prem = Person({favNo: 32, name: "Prem"}); // this way we can add one friend at a time like this. 
    
    //But what if we want to add multiple friends at the same time?
    Person[] public listOfFriends;


    function storeNo (uint Number) public
    {
        practiceNo = Number;
    }

    function readNo() public view returns(uint256) {
        return practiceNo;
    }

    function addFriends(string memory name, uint256 favNo) public
    {
         listOfFriends.push(Person(favNo,name));
    }
}
