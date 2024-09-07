module twisted_ring_counter_6bit (
    output [5:0] q,
    input clk,
    input reset
);

    wire [5:0] qnot;

    jkff jk0 (.q(q[0]), .qnot(qnot[0]), .j(~q[5]), .k(~q[5]), .clk(clk), .preset(1'b0), .clear(reset));
    jkff jk1 (.q(q[1]), .qnot(qnot[1]), .j(q[0]), .k(q[0]), .clk(clk), .preset(1'b0), .clear(reset));
    jkff jk2 (.q(q[2]), .qnot(qnot[2]), .j(q[1]), .k(q[1]), .clk(clk), .preset(1'b0), .clear(reset));
    jkff jk3 (.q(q[3]), .qnot(qnot[3]), .j(q[2]), .k(q[2]), .clk(clk), .preset(1'b0), .clear(reset));
    jkff jk4 (.q(q[4]), .qnot(qnot[4]), .j(q[3]), .k(q[3]), .clk(clk), .preset(1'b0), .clear(reset));
    jkff jk5 (.q(q[5]), .qnot(qnot[5]), .j(q[4]), .k(q[4]), .clk(clk), .preset(1'b0), .clear(reset));

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

    reg q_reg;
    reg qnot_reg;

    assign q = q_reg;
    assign qnot = qnot_reg;

    always @(posedge clk or posedge preset or posedge clear)
    begin
        if (clear) begin
            q_reg <= 0;
            qnot_reg <= 1;
        end else if (preset) begin
            q_reg <= 1;
            qnot_reg <= 0;
        end else if (j & ~k) begin
            q_reg <= 1;
            qnot_reg <= 0;
        end else if (~j & k) begin
            q_reg <= 0;
            qnot_reg <= 1;
        end else if (j & k) begin
            q_reg <= ~q_reg;
            qnot_reg <= ~qnot_reg;
        end
    end

endmodule
module tb_twisted_ring_counter_6bit;

    reg clk;
    reg reset;
    wire [5:0] q;

    // Instância do contador
    twisted_ring_counter_6bit uut (
        .q(q),
        .clk(clk),
        .reset(reset)
    );

    // Clock de 10 unidades de tempo
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