module ring_shift_register_right_5bit (
    output [4:0] q,
    input clk,
    input reset,
    input load
);

    wire [4:0] qnot;

    dff dff0 (.q(q[0]), .qnot(qnot[0]), .d(q[4]), .clk(clk), .preset(load), .clear(reset));
    dff dff1 (.q(q[1]), .qnot(qnot[1]), .d(q[0]), .clk(clk), .preset(1'b0), .clear(reset));
    dff dff2 (.q(q[2]), .qnot(qnot[2]), .d(q[1]), .clk(clk), .preset(1'b0), .clear(reset));
    dff dff3 (.q(q[3]), .qnot(qnot[3]), .d(q[2]), .clk(clk), .preset(1'b0), .clear(reset));
    dff dff4 (.q(q[4]), .qnot(qnot[4]), .d(q[3]), .clk(clk), .preset(1'b0), .clear(reset));

endmodule

module dff (
    output reg q,
    output reg qnot,
    input d,
    input clk,
    input preset,
    input clear
);

    always @(posedge clk or posedge preset or posedge clear)
    begin
        if (clear) begin
            q <= 0;
            qnot <= 1;
        end else if (preset) begin
            q <= 1;
            qnot <= 0;
        end else begin
            q <= d;
            qnot <= ~d;
        end
    end

endmodule

module tb_ring_shift_register_right_5bit;

    reg clk;
    reg reset;
    reg load;
    wire [4:0] q;

    ring_shift_register_right_5bit uut (
        .q(q),
        .clk(clk),
        .reset(reset),
        .load(load)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("At time %t, q = %b", $time, q);
        clk = 0;
        reset = 1;
        load = 0;
        #10;
        reset = 0;
        load = 1;
        #10;
        load = 0;
        #50 $finish;
    end

endmodule
