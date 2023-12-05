// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;


contract AssemblyContract {
    function yul_let() public pure returns (uint z) {
        assembly {
            let x := 123
            z := 456
        }
    }


    function yul_if(uint x) public pure returns (uint z) {
        assembly {
            if lt(x, 10) {z := 99}
        }
    }

    function min(uint x, uint y) public pure returns (uint z) {
        assembly {
            switch lt(x, y)
            case 1 { z:= x}
            default { z:= y}
        }
    }

    function max(uint x, uint y) public pure returns (uint z) {
        assembly {
            switch gt(x, y)
            case 1 { z:= x}
            default { z:= y}
        }
    }

    function yul_revert(uint x) public pure {
		assembly {
				if gt(x, 10) {
					revert(0, "Revert message")
				}
		}
}

    function yul_for_loop() public pure returns (uint z) {
        assembly {
            for { let i := 0} lt(i, 10) {i := add(i, 1)} {
                z := add(z, 1)
            }
        }
    }

     function yul_while_loop() public pure returns (uint z) {
        assembly {
            let i := 0

             for {} lt(i, 5) {} {
                i := add(i, 1)
                z := add(z, 1)
            }
        } 
    }

    function sum(uint n) public pure returns (uint z) {
        assembly {
            for {let i := 1} lt(i, n) {i := add(i, 1)} {
                z := add(z, i)
            }
        }
    }


    // Calculate x**n where n = 2**k
    // x > 0
    // No overflow check

    function pow2k(uint x, uint n) public pure returns (uint z) {
        require(x > 0, "x = 0");

        assembly {
            if mod(n, 2) {
                revert(0, 0)
            }

            switch n
            case 0 {z := 1}
            default {z := x}
            z := x

            for {} gt(n, 1) {} {

                if mod(n, 2) {
                    revert(0, 0)
                }

                z:= mul(z, z)
                n:= div(n, 2)
            }
        }

    }

}