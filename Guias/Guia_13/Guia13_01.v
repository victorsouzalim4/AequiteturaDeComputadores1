module async_down_counter_6bit (
    output [5:0] q,
    input clk,
    input reset
);

    wire [5:0] qnot;

    // Flip-Flops JK para cada bit do contador
    jkff jk0 (q[0], qnot[0], 1'b1, 1'b1, clk, reset, 1'b0);
    jkff jk1 (q[1], qnot[1], 1'b1, 1'b1, qnot[0], reset, 1'b0);
    jkff jk2 (q[2], qnot[2], 1'b1, 1'b1, qnot[1], reset, 1'b0);
    jkff jk3 (q[3], qnot[3], 1'b1, 1'b1, qnot[2], reset, 1'b0);
    jkff jk4 (q[4], qnot[4], 1'b1, 1'b1, qnot[3], reset, 1'b0);
    jkff jk5 (q[5], qnot[5], 1'b1, 1'b1, qnot[4], reset, 1'b0);

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

    reg q;
    reg qnot;

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

module tb_async_down_counter_6bit;

    reg clk;
    reg reset;
    wire [5:0] q;

    // Instância do contador
    async_down_counter_6bit uut (
        .q(q),
        .clk(clk),
        .reset(reset)
    );

    // Clock de 10 unidades de tempo
    always #5 clk = ~clk;

    initial begin
        $monitor("time %t, q = %b", $time, q);
        clk = 0;
        reset = 1;
        #10;
        reset = 0;
        #100 $finish;
    end

endmodule
