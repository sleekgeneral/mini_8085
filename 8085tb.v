`timescale 10ns/1ns
`include "my8085.v"
module my8085tb();

reg CLK, RST_, READY, HOLD, SID, INTR, TRAP, RST75, RST65, RST55;
wire [7:0] ADDRDATA;
wire [15:8] ADDR;
wire CLK_OUT, RST_OUT, IOM_, S1, S0, INTA_, WR_, RD_, ALE, HLDA, SOD;
integer i;
reg [7:0] memory [65535:0];

my8085 uut(CLK, ADDRDATA, ADDR, INTA, INTR, RST55, RST65, RST75, TRAP, SID, SOD, RST_OUT, HOLD, HLDA, CLK_OUT, RST_, READY, IOM_, S1, RD_, WR_, S0, ALE);

initial begin
	$readmemh("mem.txt",memory);
end

initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0, my8085tb);
end


initial begin CLK <= 0;
	RST_ <= 1;
	for(i=0;i<480;i=i+1)
		#5 CLK <= ~CLK;
end


reg [7:0] data;
reg [15:0] addr;
always @(posedge CLK) begin
	if(ALE)
	begin
		addr[15:8] <= ADDR [15:8];
		addr[7:0] <= ADDRDATA [7:0];
	end
end

always @(RD_) begin
	if(~RD_ && ~IOM_)
	begin
		data <= memory[addr];
	end
end

always @(posedge CLK) begin
	if(~WR_ && ~IOM_)
	begin
		memory[addr] <= ADDRDATA;
	end
end


initial begin
	addr <= 16'h0000;
	RST_ <= 0;
#10
	RST_ <= 1;
end

initial $monitor("value of memory location 16'h0021 is %0h and 16'h0023 is %0h and 16'h0024 is %0h and 16'h0025 is %0h and 16'h0026 is %0h and 16'hffff is %0h and 16'hfffe is %0h at time %0t",memory[16'h0021],memory[16'h0023],memory[16'h0024],memory[16'h0025],memory[16'h0026],memory[16'hffff],memory[16'hfffe],$time);


assign ADDRDATA = (~RD_) ? data : 8'bz;

endmodule
