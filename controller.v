`timescale 1ns/1ns

module CU (input clk,cnt, input [2:0] op,output reg mem_read,ldir,EAsrc,ldEA,memread,ALUsrcA,fnc,ldpc,writesrc
		,mem_write,ldacc,ldcy,g23,clraccond,idpccond,output reg [2:0] mem_src,ALUsrcB,pcsrc=2'b00);
	reg [3:0] ps,ns=0;
	always@(ps, op) begin
		ns = 0;
		case(ps)
			0 : ns = 1;
			1 : if( (op[0] & (~cnt))==1 && op!=3'b111) ns = 2;
				else if( ((~op[0]) & ~cnt)==1 && op!=3'b111) begin
					if(op==3'b000)
						ns = 6;
					if(op==3'b001)
						ns=5;
					if(op==3'b010)
						ns=10;
					if(op==3'b011)
						ns=8;
					if(op==3'b100)
						ns=4;
					if(op==3'b101)
						ns=3;
				end
				else
					ns = 7;
			2 : if( (op[0] & (~cnt))==1 && op!=3'b111) ns = 2;
				else if( ((~op[0]) & ~cnt)==1 && op!=3'b111) begin
					if(op==3'b000)
						ns = 6;
					if(op==3'b001)
						ns=5;
					if(op==3'b010)
						ns=10;
					if(op==3'b011)
						ns=8;
					if(op==3'b100)
						ns=4;
					if(op==3'b101)
						ns=3;
				end
			3 : ns = 0;
			4 : ns = 0;
			5 : ns = 0;
			6 : ns = 0;
			7 : ns = 0;
			8 : ns = 0;
			9 : ns = 0;
			10 : ns = 0;
			11 : ns = 0;
			12 : ns = 0;

		endcase
	end
	always@(op,ps,clk)begin
		mem_src = 2'b00;
		ALUsrcB=2'b00;
		pcsrc=2'b00;
		mem_read=0;
		ldir = 0;
		EAsrc=0;
		ldEA=0;
		memread=0;
		ALUsrcA = 0;
		fnc=0;
		ldpc=0;
		writesrc=0;
		mem_write=0;
		ldacc=0;
		ldcy=0;
		g23=0;
		clraccond=0;
		idpccond=0;

		case (ps)
			0 : begin mem_src = 2'b00; mem_read=1; ldir = 1; end 		//fetch
	
			1 : begin mem_src=2'b10; EAsrc=1; ldEA=1; memread=1; ALUsrcA=1; ALUsrcB=2'b10; pcsrc=2'b01;
				ldpc=1; fnc=1; end 								//dicode

			2 : begin mem_src=2'b11; EAsrc=1; ldEA=1;memread=1; end  //LDA
			
			3 : begin pcsrc=2'b00; ldpc=1; mem_src=2'b01; writesrc=0; mem_write=1; end   //STA

			4 : begin pcsrc=2'b00; ldpc=1; end  //ADA

			5 : begin ALUsrcA=0; ALUsrcB=2'b00; ldacc=1; ldcy=1; fnc=1; end   //ANA	

			6 : begin ALUsrcA=0; ALUsrcB=2'b00; ldacc=1; fnc=0; end 			//MVR

			7 : begin ALUsrcA=1; ALUsrcB=2'b10; pcsrc=2'b01; fnc=1; g23=1; end  //ADR

			8 : begin ALUsrcA=0; ALUsrcB=2'b01; clraccond=1; fnc=1; end  //ANR

			9 : begin mem_src=2'b01; writesrc=1; mem_write=1; end  //ORR

			10 : begin mem_src=2'b01; mem_read=1; ALUsrcA=1; ALUsrcB=2'b10; fnc=1; end

			11 : begin ALUsrcA=1; ALUsrcB=2'b00; pcsrc=2'b10; idpccond=1; fnc=1;  end

			12 : begin mem_src = 2'b01; writesrc=1; mem_write=1;  end
		endcase
	end
	always@(posedge  clk)
		ps <= ns;

endmodule