/******************************************************************************\

file:   Math.sol
ver:    0.5.0
updated:25-10-2017
author: Darryl Morris (o0ragman0o)
email:  o0ragman0o AT gmail.com

unit256 and uint64 Safe maths libraries.

---
pragma solidity ^0.4.13;

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
---

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
See MIT Licence for further details.
<https://opensource.org/licenses/MIT>.

Release Notes
-------------
* set all functions to `pure`
* Added safe uint casting for common uint sub types
* removed Math64 library


\******************************************************************************/

pragma solidity ^0.4.13;

library Math
{
    int8 constant LT = -1;
    int8 constant EQ = 0;
    int8 constant GT = 1;
    
    // a add to b
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        assert(c >= a);
    }
    
    // a subtract b
    function sub(uint a, uint b) internal pure returns (uint c) {
        c = a - b;
        assert(c <= a);
    }
    
    // a multiplied by b
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        assert(a == 0 || c / a == b);
    }
    
    // a divided by b
    function div(uint a, uint b) internal pure returns (uint c) {
        require (b != 0);
        c = a / b;
    }
    
    // Increment
    function inc(uint a) internal pure returns (uint c) {
        c = a + 1;
        assert(c > a);
    }
    
    // Decrement
    function dec(uint a) internal pure returns (uint c) {
        c = a - 1;
        assert(c < a);
    }
    
    // Raise a to power of b
    function pow(uint a, uint8 b) internal pure returns (uint c) {
        c = a**b;
        // Not a sufficient test as overflowed result may still be larger
        assert(c > a);
    }

    // Equal to
    function eq(uint a, uint b) internal pure returns (bool) {
        return a == b;
    }
    
    // Less than
    function lt(uint a, uint b) internal pure returns (bool) {
        return a < b;
    }
    
    // Greater than
    function gt(uint a, uint b) internal pure returns (bool) {
        return a > b;
    }
    
    // Less than or equal to.
    function lteq(uint a, uint b) internal pure returns (bool) {
        return a <= b;
    }
    
    // Greater than or equal to.
    function gteq(uint a, uint b) internal pure returns (bool) {
        return a >= b;
    }
    
    // Zero value test
    function isZero(uint a) internal pure returns (bool) {
        return a == 0;
    }
    
    // Parametric comparitor for > or <
    // !_sym returns a < b
    // _sym  returns a > b
    function cmp(uint a, uint b, bool sym) internal pure returns (bool)
    {
        return (a!=b) && ((a < b) != sym);
    }

    // Parametric comparitor for >= or <=
    // !_sym returns a <= b
    // _sym  returns a >= b
    function cmpEq(uint a, uint b, bool sym) internal pure returns (bool)
    {
        return (a==b) || ((a < b) != sym);
    }

    // Trinary comparitor returning int -1, 0, 1 for LT, EQ, GT
    function cmpTri(uint a, uint b) internal pure returns (int8) {
        return a < b ? LT : a > b ? GT : EQ;
    }
    
    // Safe cast from uint to uint8
    function to8(uint a) internal pure returns (uint8 b) {
        b = uint8(a);
        assert(uint(b) == a);
    }

    // Safecast from uint to uint16
    function to16(uint a) internal pure returns (uint16 b) {
        b = uint16(a);
        assert(uint(b) == a);
    }

    // Safe cast from uint to uint32
    function to32(uint a) internal pure returns (uint32 b) {
        b = uint32(a);
        assert(uint(b) == a);
    }

    // Safe cast from uint to uint40
    function to40(uint a) internal pure returns (uint40 b) {
        b = uint40(a);
        assert(uint(b) == a);
    }

    // Safe cast from uint to uint48
    function to48(uint a) internal pure returns (uint48 b) {
        b = uint48(a);
        assert(uint(b) == a);
    }

    // Safecast from uint to uint56
    function to56(uint a) internal pure returns (uint56 b) {
        b = uint56(a);
        assert(uint(b) == a);
    }

    // Safe cast from uint to uint64
    function to64(uint a) internal pure returns (uint64 b) {
        b = uint64(a);
        assert(uint(b) == a);
    }

    // Safe cast from uint to uint72
    function to72(uint a) internal pure returns (uint72 b) {
        b = uint72(a);
        assert(uint(b) == a);
    }

    // Safecast from uint to uint80
    function to80(uint a) internal pure returns (uint80 b) {
        b = uint80(a);
        assert(uint(b) == a);
    }

    // Safe cast from uint to uint96
    function to96(uint a) internal pure returns (uint96 b) {
        b = uint96(a);
        assert(uint(b) == a);
    }

    // Safecast from uint to uint128
    function to128(uint a) internal pure returns (uint128 b) {
        b = uint128(a);
        assert(uint(b) == a);
    }
    
    // Safecast from uint to uint192
    function to192(uint a) internal pure returns (uint192 b) {
        b = uint192(a);
        assert(uint(b) == a);
    }
}