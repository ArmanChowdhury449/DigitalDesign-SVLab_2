module tb_randomize_p2;

// Parameters
localparam int WIDTH = 16;
localparam int INSTR_LEN = 20;
localparam int ADDR = 5;
localparam int PROG_LEN =100;

  logic clk, reset, go;
  logic instruction_done;
  logic [WIDTH-1:0] result;
  logic [WIDTH-1:0] expected = 0;

  // For memory interface
  logic        wr_en;
  logic [ADDR-1:0]  wr_addr;
  logic [INSTR_LEN-1:0] wr_data;

  // Local variables for loops
  int i,j;

// Temporary signals for coverage
  logic [7:0] a_sig, b_sig;
  logic [3:0] opcode_sig;

  // Instantiate DUT
  top  #(.WIDTH(WIDTH),.INSTR_LEN(INSTR_LEN),.ADDR(ADDR),.PROG_LEN(PROG_LEN)) dut (
    .clk(clk),
    .reset(reset),
    .go(go),
    .done(instruction_done),
    .result(result),

    // memory connections
    .wr_en(wr_en),
    .wr_addr(wr_addr),
    .wr_data(wr_data)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;



  // ===== CRV Instruction Class =====
  class instr;
    rand bit [3:0] opcode;    // 4-bit opcode
    rand bit [7:0] a, b;      // 8-bit operands

  endclass
