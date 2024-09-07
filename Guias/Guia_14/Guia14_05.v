module parallel_to_serial_converter (
    output serial_out,
    input [4:0] parallel_in,
    input clk,
    input reset,
    input load
);

    reg [4:0] shift_reg;

    assign serial_out = shift_reg[4];

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            shift_reg <= 5'b0;
        else if (load)
            shift_reg <= parallel_in;
        else
            shift_reg <= {shift_reg[3:0], 1'b0};
    end

endmodule

module tb_parallel_to_serial_converter;

    reg clk;
    reg reset;
    reg load;
    reg [4:0] parallel_in;
    wire serial_out;

    parallel_to_serial_converter uut (
        .serial_out(serial_out),
        .parallel_in(parallel_in),
        .clk(clk),
        .reset(reset),
        .load(load)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("At time %t, serial_out = %b", $time, serial_out);
        clk = 0;
        reset = 1;
        parallel_in = 5'b10101;
        load = 0;
        #10;
        reset = 0;
        load = 1;
        #10;
        load = 0;
        #50 $finish;
    end

endmodule
