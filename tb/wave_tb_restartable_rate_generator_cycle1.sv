`timescale 1ns / 1ps
module wave_tb_restartable_rate_generator_cycle1;
  logic clk;
  logic run;
  logic tick;

  restartable_rate_generator #(
      .CYCLE_COUNT(1)
  ) dut (
      .clk (clk),
      .run (run),
      .tick(tick)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $dumpfile("wave_tb_restartable_rate_generator_cycle1.vcd");
    $dumpvars(0, wave_tb_restartable_rate_generator_cycle1);

    // run low — tick should be low
    run = 0;
    #20;

    // run high — tick should follow immediately
    run = 1;
    #50;

    // run low again — tick should go low
    run = 0;
    #20;

    $finish;
  end
endmodule
