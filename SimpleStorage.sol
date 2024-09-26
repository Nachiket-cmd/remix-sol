// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //we start our solidity code with specifying the version of solidity we are working with. "^" this means that we are okay with working with any version greater than 0/8.7
// pragma solidity >=0.8.7 >0.9.1  this means that we are okay to work with any versions between these.

contract SimpleStorage {
    /* Basic datatypes in Solidity. 
    boolean, uint(unsigned int), int, address, bytes
    */
    // we can specify how many bits we want to allocate to the variable using uint and int. example: uint8(takes 8 bits). By default it is uint256.
    // uint32 randomNo= 312; //min uint8
    // address account1= 0x36cB3eFDc854A21B7eEE9c96E3CC2CEc7f339094;
    // bytes12 hi= "hello"; //max 32.. it starts with 0x{and then something random}
    uint256 public favNumber;  //set to 0 by default. By writing public, we are basically, creating a getter function to return the value stored in the function.
    
    function store(uint256 _favNumber) public{
        favNumber = _favNumber;
        retrieve(); //although using retrieve wont normally cost gas, but in this case as the function is being called by store, which is making changes to the state. It will cost gas.
    }
    // 0xd9145CCE52D386f254917e481eB44e9943F39138
    //anytime whenever we are doing anything to modify the blockchain, in this case we are modifying the blockchain by deploying this code in it. All of these changes are done by sending a transaction.
    // deploying a contract is also modifying a blockchain, so we do it by sending a transaction.
    
    struct Person {
        uint256 favNo;
        string name;
    }

    /* Funciton visibilty specifiers
     1. public: visible externally and internally
     2. private: only visible in the current contract
     3. external: only visible externally(only for functions) - i.e can only be message called
     4. internal: only visible internally (functions are also set to internal by default)
     */

    //view : read state from the blockchain. you cannot make any changes to the state of blockchain in this. which basically means that you can only read.
    //pure : this disallow updating state and even reading state from the blockchain  
     function retrieve() public view returns(uint256){  //when we use view,pure in a function. these functions do not need to send any transactions to call them.
     // functions with view are just used to read the values stored in any other function.
        return favNumber;
     }
     Person[] public randomArr;
     function addArr(uint256 _favNo, string memory _name) public {//All the numbers are default to memory in function, but string is a special datatype in solidity so we have to specify it.
           randomArr.push(Person(_favNo,_name));
           //Struct, mapping and arrays need memory/calldata decalration because these are special datatypes. Since string is also a collection of bytes of array. memory is needed in it too.
     }
     /*The main differenc between memory and calldata is that, we can change a variable of memory type, whereas we cannot change a variable as calldata. */

}

