module sync_mod7_counter (
    output [2:0] q,
    input clk,
    input reset
);

    wire [2:0] q_int;

    tff tff0 (.q(q_int[0]), .t(1'b1), .clk(clk), .reset(reset));
    tff tff1 (.q(q_int[1]), .t(q_int[0]), .clk(clk), .reset(reset));
    tff tff2 (.q(q_int[2]), .t(q_int[0] & q_int[1]), .clk(clk), .reset(reset));

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 3'b000;
        else if (q_int == 3'b111)
            q <= 3'b000;
        else
            q <= q_int;
    end

endmodule

module tff (
    output q,
    input t,
    input clk,
    input reset
);

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 0;
        else if (t)
            q <= ~q;
    end

endmodule

module tb_sync_mod7_counter;

    reg clk;
    reg reset;
    wire [2:0] q;

    // Instância do contador
    sync_mod7_counter uut (
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
