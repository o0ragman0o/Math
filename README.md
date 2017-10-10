# Math

A Solidity math library with overflow checking

example usage:

```
pragma solidity ^0.4.11;

import "Math.sol"

contract K{
    using MathU for uint;
    uint num;
   
    function foo(uint x) {
        ...
        num = num.add(x);
        ...
    }
}
```

### add

a add to b

`function add(uint a, uint b) internal pure returns (uint c)`

### sub

a subtract b

`function sub(uint a, uint b) internal pure returns (uint c)`

### mul
    
a multiplied by b

`function mul(uint a, uint b) internal pure returns (uint c)`

### div
    
a divided by b

`function div(uint a, uint b) internal pure returns (uint c)`

### inc

Increment a

`function inc(uint a) internal pure returns (uint c)`

### dec

Decrement a

`function dec(uint a) internal pure returns (uint c)`

### pow

Raise a to power of b (Warning: no overflow checking)

`function pow(uint a, uint8 b) internal pure returns (uint c)`

### eq

Equates a to b

`function eq(uint a, uint b) internal pure returns (bool)`

### lt

a less than b

`function lt(uint a, uint b) internal pure returns (bool)`

### gt

a greater than b

`function gt(uint a, uint b) internal pure returns (bool)`

### lteq

a less than or equal to b

`function lteq(uint a, uint b) internal pure returns (bool)`

### gteq

a greater than or equal to b

`function gteq(uint a, uint b) internal pure returns (bool)`

### isZero

a is zero

`function isZero(uint a) internal pure returns (bool)`

### cmp

Parametric comparitor test.
a > b where sym == true
a < b where sym == false

`function cmp(uint a, uint b, bool sym) internal pure returns (bool)`

### cmpEq

Parametric comparitor test.
a >= b where sym == true
a <= b where sym == false

`function cmpEq(uint a, uint b, bool sym) internal pure returns (bool)`

### cmpTri

Trinary comparitor returning int -1, 0, 1 for LT, EQ, GT

`function cmpTri(uint a, uint b) internal pure returns (int8)`