// -------------------------
// Guia_0801 
// Nome: Victor Souza Lima
// Matrícula: 835287
// -------------------------
// half adder module
// -------------------------
module halfAdder(output s, output carry, input a, input b);
    xor (s, a, b);
    and (carry, a, b);
endmodule

// -------------------------
// full adder module
// -------------------------
module fullAdder(output sum, output carryOut, input a, input b, input carryIn);
    wire s_half, carry_half1, carry_half2;
    
    halfAdder HA1(s_half, carry_half1, a, b);
    halfAdder HA2(sum, carry_half2, s_half, carryIn);
    or (carryOut, carry_half1, carry_half2);
endmodule

// -------------------------
// 5-bit Arithmetic Unit (AU) with Full Adder
// -------------------------
module ArithmeticUnit(output [4:0] sum, output finalCarry, input [4:0] a, input [4:0] b, input initialCarry);
    wire [4:0] carry;
    
    fullAdder FA0(sum[0], carry[0], a[0], b[0], initialCarry);
    fullAdder FA1(sum[1], carry[1], a[1], b[1], carry[0]);
    fullAdder FA2(sum[2], carry[2], a[2], b[2], carry[1]);
    fullAdder FA3(sum[3], carry[3], a[3], b[3], carry[2]);
    fullAdder FA4(sum[4], finalCarry, a[4], b[4], carry[3]);
endmodule

// -------------------------
// Test Module for Arithmetic Unit
// -------------------------
module testArithmeticUnit;
    reg [4:0] x, y;
    wire [4:0] result;
    wire carryOut;
    
    // Instantiate the Arithmetic Unit
    ArithmeticUnit AU(result, carryOut, x, y, 1'b0);
    
    initial begin
        $display("Guia_0801 - André Luiz Rocha Cabral - 82007");
        $display("Test AU's 5-bit full adder");
        
        // Test case
        x = 5'b10010; // -14 in two's complement
        y = 5'b01101; // 13
        #10; // Wait for 10 time units
        
        $display("x = %b, y = %b, sum = %b, carryOut = %b", x, y, result, carryOut);
    end
endmodule
