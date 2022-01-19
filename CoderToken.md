## Build a Blokchain Token using ERC-20 Standards

```
mkdir my-first-token
cd my-first-token 
```



```
truffle unbox tutorialtoken
```

Explore the content of the project.


```
Commands:

  Compile:        truffle compile
  Migrate:        truffle migrate
  Test contracts: truffle test
  Run dev server: npm run dev
```


```
npm install @openzeppelin/contracts
```

Explore node_modules -> Standard ERC20


### Start local Blockchain Ganache-cli

```
ganache-cli 
```

Comment what we are seeing from the console.

### Update the port and the compiler on truffle.js


Port: 8545

Compiler:

```
module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    }
  },
  compilers: {
    solc: {
      version: '0.8.0', // A version or constraint - Ex. "^0.5.0"
      parser: "solcjs",  // Leverages solc-js purely for speedy parsing
    }
  }
};
```



### Update migration based on the compiler 

Write migration file

```
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Migrations {
  address public owner;
  uint public last_completed_migration;

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  function upgrade(address new_address) public restricted {
    Migrations upgraded = Migrations(new_address);
    upgraded.setCompleted(last_completed_migration);
  }
}
```

Write the CoderToken Smart contract

```
// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract CoderToken is ERC20 {

    uint256 public INITIAL_SUPPLY = 42000000;
    
    constructor() ERC20("CoderToken", "CDT") {
        decimals();
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
        
}
```

### Compile the smart contract

```
truffle compile
```


Look on build folder


### Deploy the smart contract to Ganache-cli


```
truffle deploy
```

Look on Ganache-cli and comment


### Update the User-Interface to work with our Coder Tokens


Edit index.html

From "TTBalance" -> "CDTBalance" 
From "TTransferAddress" -> "CDTransferAddress"
From "TTransferAmount" -> "CDTransferAmount"


### Update app.js 

From "TutorialToken" -> "CoderToken"

"TTTransferAmount" -> "CDTransferAmount"
"TTTransferAddress" -> "CDTransferAddress"
"TTBalance" -> "CDTBalance"

### Run the Web Wallet of Coder Tokens

```
npm run dev
```

Connect Metamask and try to send Coder tokens!

Enjoy!!!!



 













