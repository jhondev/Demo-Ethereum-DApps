pragma solidity ^ 0.4 .24;

contract GammaCalculator { //#A
    function calculateGamma(int _y, int _z) external returns(int _gamma) {
        _gamma = _y * 3 + 7 * _z;
    }
}

contract TaxCalculator2 {

    GammaCalculator gammaCalculator;

    function TaxCalculator(address _gammaCalculatorAddress) public {
        gammaCalculator = GammaCalculator(_gammaCalculatorAddress); //#B
    }

    function calculateAlpha(int _x, int _y, int _z)
    public returns(int _alpha) {
        _alpha = _x + gammaCalculator.calculateGamma(_y, _z); //#C
    }
}

contract TaxCalculator3 {
    function calculateAlpha(int _x, int _y, int _z)
    public returns(int _alpha) {
        _alpha = _x + this.calculateGamma(_y, _z); //#A
    }

    function calculateGamma(int _y, int _z)
    public returns(int _gamma) { //#B
        _gamma = _y * 3 + 7 * _z;
    }
}

// #A the call on calculateGamma through 'this' behaves as a call on an external contract, so a transaction message is generated and this gets stored on the blockchain
// #B In order to be called through this, calculateGamma must be declared as public