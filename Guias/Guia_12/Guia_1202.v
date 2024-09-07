//------------------
// Nome: Victor Souza Lima
// Matrícula: 835287
//___________________

module RAM_1x8(
    input wire clk,
    input wire write_en,
    input wire address,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] memory [0:0];  

always @(posedge clk) begin
    if (write_en) begin
        memory[0] <= data_in;  
    end
end

always @(negedge clk) begin
    data_out <= memory[0];  
end

endmodule

module test;
    reg clk, write_en, address;
    reg [7:0] data_in;
    wire [7:0] s;

    RAM_1x8 moduleRam (clk, write_en, address, data_in, s); 

    initial begin
        $display("Test Module");
        
       
        $monitor ("%4d %4d %4d %4b | %4b", clk, write_en, address, data_in, s);
        clk = 1;
        write_en = 1;
        address = 1;
        data_in = 8'b10010100;  // Correção para atribuição de bits específicos

        // Exemplo de ciclo de clock
        #10 clk = 0; write_en = 1; address = 0; data_in = 8'b00010100;  
        #10 clk = 1; write_en = 1; address = 1; data_in = 8'b11110000;  
        #10 clk = 0;  
        
    end
endmodule

/*
Test Module
   1    1    1 10010100 | xxxxxxxx
   0    1    0 00010100 | 10010100
   1    1    1 11110000 | 10010100
   0    1    1 11110000 | 11110000
*/
