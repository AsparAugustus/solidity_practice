// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {AssemblyContract} from "../src/Assembly.sol";

contract AssemblyTest is Test {

    AssemblyContract AC;

    function setUp() public {

        AC = new AssemblyContract();
    }


    function test1() public {
        
        assertEq(AC.yul_let(), 456);
    }

    function test2() public {
        assertEq(AC.yul_if(1), 99);
    }


}
