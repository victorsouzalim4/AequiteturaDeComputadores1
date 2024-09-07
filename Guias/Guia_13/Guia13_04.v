module async_decade_down_counter_4bit (
    output [3:0] q,
    input clk,
    input reset
);

    wire [3:0] q_int;
    wire [3:0] qnot_int;

    jkff jk0 (.q(q_int[0]), .qnot(qnot_int[0]), .j(1'b1), .k(1'b1), .clk(clk), .preset(1'b0), .clear(reset));
    jkff jk1 (.q(q_int[1]), .qnot(qnot_int[1]), .j(1'b1), .k(1'b1), .clk(qnot_int[0]), .preset(1'b0), .clear(reset));
    jkff jk2 (.q(q_int[2]), .qnot(qnot_int[2]), .j(1'b1), .k(1'b1), .clk(qnot_int[1]), .preset(1'b0), .clear(reset));
    jkff jk3 (.q(q_int[3]), .qnot(qnot_int[3]), .j(1'b1), .k(1'b1), .clk(qnot_int[2]), .preset(1'b0), .clear(reset));

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 4'b1001;
        else if (q_int == 4'b0000)
            q <= 4'b1001;
        else
            q <= q_int;
    end

endmodule

module jkff (
    output q,
    output qnot,
    input j,
    input k,
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
        end else if (j & ~k) begin
            q <= 1;
            qnot <= 0;
        end else if (~j & k) begin
            q <= 0;
            qnot <= 1;
        end else if (j & k) begin
            q <= ~q;
            qnot <= ~qnot;
        end
    end

endmodule

module tb_async_decade_down_counter_4bit;

    reg clk;
    reg reset;
    wire [3:0] q;

    async_decade_down_counter_4bit uut (
        .q(q),
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("At time %t, q = %b", $time, q);
        clk = 0;
        reset = 1;
        #10;
        reset = 0;
        #100 $finish;
    end

endmodule
