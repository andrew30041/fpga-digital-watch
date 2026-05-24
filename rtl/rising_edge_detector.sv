`timescale 1ns / 1ps

module rising_edge_detector (
    input  logic clk,
    input  logic sig_in,
    output logic rise
);
  logic last_sig;
  initial last_sig = '1;

  always_comb begin
    if (!last_sig & sig_in) rise = '1;
    else rise = '0;
  end
  always_ff @(posedge clk) begin
    last_sig <= sig_in;
  end

endmodule
