module TB_Half_adder;

    reg bit1_tb = 0;
    reg bit2_tb = 0;
    wire sum_tb;
    wire carry_tb;

    Half_adder Half_adder_inst
    (
        .bit1_i(bit1_tb),
        .bit2_i(bit1_tb),
        .sum_o(sum_tb),
        .carry_o(carry_tb)
    );

    initial 
     begin
      r_BIT1 = 1'b0;
      r_BIT2 = 1'b0;
      #10;
      r_BIT1 = 1'b0;
      r_BIT2 = 1'b1;
      #10;
      r_BIT1 = 1'b1;
      r_BIT2 = 1'b0;
      #10;
      r_BIT1 = 1'b1;
      r_BIT2 = 1'b1;
      #10;
    end
endmodule