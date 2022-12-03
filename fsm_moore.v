module moore_fsm(
input x ,
input reset,
input clk,
output y
);


reg[2:0] next_state , state_reg ;

localparam s0 = 0;
localparam s1 = 1;
localparam s2 = 2;
localparam s3 = 3;
localparam s4 = 4;
localparam s5 = 5;
// registers block
always @(posedge clk, negedge reset)
begin
if(~reset)
state_reg <=s0;
else 
  state_reg <=next_state;
end


//sequence for detecting the odd number of 1
// 00 is the enable of the sequence 
always @(*) 
begin
  casex(state_reg)
  s0: if (x) next_state <= s1;
else  next_state <= s2;
  s1: if (x) next_state <= s0;
else  next_state <= s3;
  s2: if (x) next_state <= s1;
else  next_state <= s5;
  s3: if (x) next_state <= s0;
else  next_state <= s4;
  s4: if (x) next_state <= s5;
else  next_state <= s4;
  s5: if (x) next_state <= s4;
else  next_state <= s5;
  default: next_state <= s0;
endcase  
end

// output equation for moore machine 

assign y = (state_reg==s4);
 






endmodule