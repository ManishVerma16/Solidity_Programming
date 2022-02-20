pragma solidity >=0.6.0 <0.9.0;

// pragma solidity ^0.6.0; // set to specific version of solidity

contract SimpleStorage {
    // datatypes
    uint256 public favoriteNumber;

    bool favoriteBool = true; // boolean
    string favoriteString = "Test String"; // string
    int256 favoriteInt = -5; // can be +ve or -ve integer
    address favoriteAddress = 0xF80C601223C45f88da0683841BFc651a11E69090; // hex address
    bytes32 favoriteByte = "cat"; //

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function retrieve2(uint256 favoriteNumber) public pure {
        favoriteNumber + favoriteNumber;
    }

    function retrieve3(uint256 favoriteNumber) public pure returns (uint256) {
        return favoriteNumber + favoriteNumber;
    }

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People public person1 = People({favoriteNumber: 2, name: "Mish"});

    // People[] public people; // dynamic array

    // function addPerson(string memory _name, uint256 _favoriteNumber) public {
    //     // people.push(People({favoriteNumber: _favoriteNumber, name: _name}));
    //     people.push(People(_favoriteNumber, _name));
    // }

}

// view keyword is used to check/see the state of the (blockchain) function or variable without changing them.

// by default all variables have view function so that by creating them public we can easily check their value

// pure variable is used for doing some mathematics stuffs but it can also show results when used with return statement.
