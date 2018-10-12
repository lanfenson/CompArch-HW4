//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "register32.v"
`include "register32zero.v"
`include "mux32to1by1.v"
`include "mux32to1by32.v"
`include "decoders.v"

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);
  wire[31:0] decode_out;
  wire[31:0] reg0out,reg1out,reg2out,reg3out,reg4out,reg5out,reg6out,reg7out,reg8out,reg9out,reg10out,reg11out,reg12out,reg13out,reg14out,reg15out,reg16out,reg17out,reg18out,reg19out,reg20out,reg21out,reg22out,reg23out,reg24out,reg25out,reg26out,reg27out,reg28out,reg29out,reg30out,reg31out;


  decoder1to32 decode(decode_out,RegWrite,WriteRegister); //Choose register to write to

  register32zero reg0(reg0out,WriteData,RegWrite,Clk);
  register32 reg1(reg1out,WriteData,RegWrite,Clk);
  register32 reg2(reg2out,WriteData,RegWrite,Clk);
  register32 reg3(reg3out,WriteData,RegWrite,Clk);
  register32 reg4(reg4out,WriteData,RegWrite,Clk);
  register32 reg5(reg5out,WriteData,RegWrite,Clk);
  register32 reg6(reg6out,WriteData,RegWrite,Clk);
  register32 reg7(reg7out,WriteData,RegWrite,Clk);
  register32 reg8(reg8out,WriteData,RegWrite,Clk);
  register32 reg9(reg9out,WriteData,RegWrite,Clk);
  register32 reg10(reg10out,WriteData,RegWrite,Clk);
  register32 reg11(reg11out,WriteData,RegWrite,Clk);
  register32 reg12(reg12out,WriteData,RegWrite,Clk);
  register32 reg13(reg13out,WriteData,RegWrite,Clk);
  register32 reg14(reg14out,WriteData,RegWrite,Clk);
  register32 reg15(reg15out,WriteData,RegWrite,Clk);
  register32 reg16(reg16out,WriteData,RegWrite,Clk);
  register32 reg17(reg17out,WriteData,RegWrite,Clk);
  register32 reg18(reg18out,WriteData,RegWrite,Clk);
  register32 reg19(reg19out,WriteData,RegWrite,Clk);
  register32 reg20(reg20out,WriteData,RegWrite,Clk);
  register32 reg21(reg21out,WriteData,RegWrite,Clk);
  register32 reg22(reg22out,WriteData,RegWrite,Clk);
  register32 reg23(reg23out,WriteData,RegWrite,Clk);
  register32 reg24(reg24out,WriteData,RegWrite,Clk);
  register32 reg25(reg25out,WriteData,RegWrite,Clk);
  register32 reg26(reg26out,WriteData,RegWrite,Clk);
  register32 reg27(reg27out,WriteData,RegWrite,Clk);
  register32 reg28(reg28out,WriteData,RegWrite,Clk);
  register32 reg29(reg29out,WriteData,RegWrite,Clk);
  register32 reg30(reg30out,WriteData,RegWrite,Clk);
  register32 reg31(reg31out,WriteData,RegWrite,Clk);

  mux32to1by32 readmux1(ReadData1,ReadRegister1,reg0out,reg1out,reg2out,reg3out,reg4out,reg5out,reg6out,reg7out,reg8out,reg9out,reg10out,reg11out,reg12out,reg13out,reg14out,reg15out,reg16out,reg17out,reg18out,reg19out,reg20out,reg21out,reg22out,reg23out,reg24out,reg25out,reg26out,reg27out,reg28out,reg29out,reg30out,reg31out);
  mux32to1by32 readmux2(ReadData2,ReadRegister2,reg0out,reg1out,reg2out,reg3out,reg4out,reg5out,reg6out,reg7out,reg8out,reg9out,reg10out,reg11out,reg12out,reg13out,reg14out,reg15out,reg16out,reg17out,reg18out,reg19out,reg20out,reg21out,reg22out,reg23out,reg24out,reg25out,reg26out,reg27out,reg28out,reg29out,reg30out,reg31out);

  // These two lines are clearly wrong.  They are included to showcase how the
  // test harness works. Delete them after you understand the testing process,
  // and replace them with your actual code.
  //assign ReadData1 = 42;
  //assign ReadData2 = 42;

endmodule
