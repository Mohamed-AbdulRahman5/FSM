`timescale 1ns / 100ps
module fsm_tb ();
  
  reg clk,reset,x ;
  wire y;
  
 fsm u_1 (.x(x),.clk(clk),.reset(reset),.y(y)) ;
 
 //reset and clk initialization 
 initial
 begin
  reset =1'b1;
  clk=1'b0; 
  #2  reset =1'b0;
  #3  reset =1'b1; 
 end
 
 //clock generation block
 always #5 clk =~clk;
 
 
 // input condition test
 initial
 begin
   x=1'b0;
   #7 x=1'b0;
   #10 x=1'b1;
   #10 x=1'b0;
   #10 x=1'b1;
   #10 x=1'b0;
   #10 x=1'b0;
   #10 x=1'b1;
   #10 x=1'b0;
   #10 x=1'b0;  
   #10 x=1'b0;
   #10 x=1'b1;
   #10 x=1'b0;
   #10 x=1'b0;
   #10 x=1'b1;
   #10 x=1'b1;
   #10 x=1'b0;
   #10 x=1'b1;
   #10 x=1'b0;   
   
   
   
   end
 
 
 
 
 
 
 endmodule
 