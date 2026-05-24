`timescale 1ns / 1ps

module key_synchroniser (
    input logic clk,
    input logic [3:0] key_n,  // active-low, asynchronous
    output logic [3:0] key_sync  // active-high, synchronous
);
  // explicit initial values - doesn't use initial block
  logic [3:0] state1 = 4'b0;
  logic [3:0] state2 = 4'b0;

  always_ff @(posedge clk) begin
    state2 <= state1;
    state1 <= ~key_n;
  end

  assign key_sync = state2;

endmodule
