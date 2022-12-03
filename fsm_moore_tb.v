`timescale 1 ns /100 ps
module mooore_tb ();
  
  reg x,clk,reset,enable ;
  wire y;
  
  
  
  
  moore_m  m_tb(
 .x(x),
.clk(clk) ,
.reset(reset),
.enable(enable),
.y(y)
);
  
  
  
  initial 
  begin
   enable =1'b1;//enabling the mashine 
   reset =1'b1;//to rese to a known state
   clk =1'b0;
    #7 reset =1'b0;   
  end
  
  //clock generation for tb
always #5 clk = ~clk;


//tb block
initial 
begin
  //  entering sequence of 01100111100 
  x=0;
  //starting sequence from second edge of clk
  #11 x=1;
  #5 x=1;
   #5 x=0;
   #5 x=0;
   #5 x=1;
   #5 x=1;
   #5 x=1;
   #5 x=1;
   #5 x=1;
   #5 x=0;
  #5 x=0;
  
end
endmodule 