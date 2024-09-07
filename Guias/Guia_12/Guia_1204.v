//------------------
// Nome: Victor Souza Lima
// Matrícula: 835287
//___________________

module RAM_4x8(
    input wire clk,
    input wire write_en,
    input wire [3:0] address,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] memory [3:0];

always @(posedge clk) begin
    if (write_en) begin
        memory[address] <= data_in; 
    end
end

always @(negedge clk) begin
    data_out <= memory[address];  
end

endmodule

module test;
    reg clk, write_en;
    reg [3:0] address;
    reg [7:0] data_in;
    wire [7:0] s;

    RAM_4x8 moduleRam (clk, write_en, address, data_in, s); 

    initial begin
        $display("Test Module");
        
        
        $monitor ("%4d %4d %4d %4b | %4b", clk, write_en, address, data_in, s);
        clk = 1'b1;
        write_en = 1'b1;
        address = 0;
        data_in = 8'b10010100;  

        
        #10 clk = 1'b0; write_en = 1'b1; address = 0; data_in = 8'bxxxxxxxx;  
        #10 clk = 1'b1; write_en = 1'b1; address = 1; data_in = 8'b11110000;  
        #10 clk = 1'b0; write_en = 1'b0; address = 1; data_in = 8'bxxxxxxxx;
        #10 clk = 1'b1; write_en = 1'b1; address = 2; data_in = 8'b10101010;
        #10 clk = 1'b0; write_en = 1'b0; address = 2; data_in = 8'bxxxxxxxx;
        #10 clk = 1'b1; write_en = 1'b1; address = 3; data_in = 8'b10000011;
        #10 clk = 1'b0; write_en = 1'b0; address = 3; data_in = 8'bxxxxxxxx;
        #10 clk = 1'b1;
        #10 clk = 1'b0; write_en = 1'b0; address = 0; data_in = 8'bxxxxxxxx; 
        
    end
endmodule

/*
Test Module
   1    1    0 10010100 | xxxxxxxx
   0    1    0 xxxxxxxx | 10010100
   1    1    1 11110000 | 10010100
   0    0    1 xxxxxxxx | 11110000
   1    1    2 10101010 | 11110000
   0    0    2 xxxxxxxx | 10101010
   1    1    3 10000011 | 10101010
   0    0    3 xxxxxxxx | 10000011
   1    0    3 xxxxxxxx | 10000011
   0    0    0 xxxxxxxx | 10010100
*/
