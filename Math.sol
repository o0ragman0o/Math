/******************************************************************************\

file:   Math.sol
ver:    0.3.1
updated:14-July-2017
author: Darryl Morris (o0ragman0o)
email:  o0ragman0o AT gmail.com

A simple uint overflow checking maths library.

---
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
---

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
See MIT Licence for further details.
<https://opensource.org/licenses/MIT>.

Release Notes
-------------
* Added uint64 version of library

\******************************************************************************/

pragma solidity ^0.4.11;

library Math
{
    int8 constant LT = -1;
    int8 constant GT = 1;
    int8 constant EQ = 0;
    
    // a add to b
    function add(uint a, uint b) internal returns (uint c) {
        c = a + b;
        assert(c >= a);
    }
    
    // a subtract b
    function sub(uint a, uint b) internal returns (uint c) {
        c = a - b;
        assert(c <= a);
    }
    
    // a multiplied by b
    function mul(uint a, uint b) internal returns (uint c) {
        c = a * b;
        assert(a == 0 || c / a == b);
    }
    
    // a divided by b
    function div(uint a, uint b) internal returns (uint c) {
        c = a / b;
        // No assert required as no overflows are posible.
    }
    
    // Increment
    function inc(uint a) internal returns (uint c) {
        c = a + 1;
        assert(c > a);
    }
    
    // Decrement
    function dec(uint a) internal returns (uint c) {
        c = a - 1;
        assert(c < a);
    }
    
    // Raise a to power of b
    function pow(uint a, uint8 b) internal returns (uint c) {
        c = a**b;
        // Not a sufficient test as overflowed result may still be larger
        assert(c > a);
    }

    // Equal to
    function eq(uint a, uint b) internal returns (bool) {
        return a == b;
    }
    
    // Less than
    function lt(uint a, uint b) internal returns (bool) {
        return a < b;
    }
    
    // Greater than
    function gt(uint a, uint b) internal returns (bool) {
        return a > b;
    }
    
    // Less than or equal to.
    function lteq(uint a, uint b) internal returns (bool) {
        return a <= b;
    }
    
    // Greater than or equal to.
    function gteq(uint a, uint b) internal returns (bool) {
        return a >= b;
    }
    
    // Zero value test
    function isZero(uint a) internal returns (bool) {
        return a == 0;
    }
    
    // Parametric comparitor for > or <
    // !_sym returns a < b
    // _sym  returns a > b
    function cmp(uint a, uint b, bool sym) internal constant returns (bool)
    {
        return (a!=b) && ((a < b) != sym);
    }

    // Parametric comparitor for >= or <=
    // !_sym returns a <= b
    // _sym  returns a >= b
    function cmpEq(uint a, uint b, bool sym) internal constant returns (bool)
    {
        return (a==b) || ((a < b) != sym);
    }

    // Trinary comparitor returning int -1, 0, 1 for LT, EQ, GT
    function cmpTri(uint a, uint b) internal returns (int8) {
        return a < b ? LT : a > b ? GT : EQ;
    }
}

// A library for 64bit unsigned integers
library Math64
{
    int8 constant LT = -1;
    int8 constant GT = 1;
    int8 constant EQ = 0;
    
    // a add to b
    function add(uint64 a, uint64 b) internal returns (uint64 c) {
        c = a + b;
        assert(c >= a);
    }
    
    // a subtract b
    function sub(uint64 a, uint64 b) internal returns (uint64 c) {
        c = a - b;
        assert(c <= a);
    }
    
    // a multiplied by b
    function mul(uint64 a, uint64 b) internal returns (uint64 c) {
        c = a * b;
        assert(a == 0 || c / a == b);
    }
    
    // a divided by b
    function div(uint64 a, uint64 b) internal returns (uint64 c) {
        c = a / b;
        // No assert required as no overflows are posible.
    }
    
    // Increment
    function inc(uint64 a) internal returns (uint64 c) {
        c = a + 1;
        assert(c > a);
    }
    
    // Decrement
    function dec(uint64 a) internal returns (uint64 c) {
        c = a - 1;
        assert(c < a);
    }
    
    // Raise a to power of b
    function pow(uint64 a, uint8 b) internal returns (uint64 c) {
        c = a**b;
        // Not a sufficient test as overflowed result may still be larger
        assert(c > a);
    }

    // Equal to
    function eq(uint64 a, uint64 b) internal returns (bool) {
        return a == b;
    }
    
    // Less than
    function lt(uint64 a, uint64 b) internal returns (bool) {
        return a < b;
    }
    
    // Greater than
    function gt(uint64 a, uint64 b) internal returns (bool) {
        return a > b;
    }
    
    // Less than or equal to.
    function lteq(uint64 a, uint64 b) internal returns (bool) {
        return a <= b;
    }
    
    // Greater than or equal to.
    function gteq(uint64 a, uint64 b) internal returns (bool) {
        return a >= b;
    }
    
    // Zero value test
    function isZero(uint64 a) internal returns (bool) {
        return a == 0;
    }
    
    // Parametric comparitor for > or <
    // !_sym returns a < b
    // _sym  returns a > b
    function cmp(uint64 a, uint64 b, bool sym) internal constant returns (bool)
    {
        return (a!=b) && ((a < b) != sym);
    }

    // Parametric comparitor for >= or <=
    // !_sym returns a <= b
    // _sym  returns a >= b
    function cmpEq(uint64 a, uint64 b, bool sym) internal constant returns (bool)
    {
        return (a==b) || ((a < b) != sym);
    }

    // Trinary comparitor returning int -1, 0, 1 for LT, EQ, GT
    function cmpTri(uint64 a, uint64 b) internal returns (int8) {
        return a < b ? LT : a > b ? GT : EQ;
    }
}