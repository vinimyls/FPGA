module Half_adder
    (
        bit1_i, bit2_i, sum_o, carry_o
    );
    input   bit1_i;
    input   bit2_i;
    output  sum_o;
    output  carry_o;

    assign sum_o    = bit1_i ^ bit2_i;
    assign carry_o  = bit1_i & bit2_i;

endmodule