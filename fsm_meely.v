module fsm (
input x,
input clk,
input reset,
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


// next state equation
  //fsm to detect 010 or 1001 with overlap 

always @(*) 
begin
  casex(state_reg)
  s0: if (x) next_state <= s1;
else  next_state <= s4;
  s1: if (x) next_state <= s2;
else  next_state <= s1;
  s2: if (x) next_state <= s4;
else  next_state <= s3;
  s3: if (x) next_state <= s2;
else  next_state <= s5;
  s4: if (x) next_state <= s4;
else  next_state <= s3;
  s5: if (x) next_state <= s2;
else  next_state <= s1;
  default: next_state <= s0;
endcase  
end

//output equation 
 assign y= (((state_reg==s2)&(~x))|((state_reg==s5)& x));
 
 
 endmodule
 
