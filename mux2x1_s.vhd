library ieee;
use ieee.std_logic_1164.all; 

  entity mux2x1_s is 
    port(A: in std_logic_vector(7 downto 0);
         B: in std_logic_vector(7 downto 0);
         Se: in std_logic ; 
         Sa: out std_logic_vector(7 downto 0));
         
end mux2x1_s;
    
    architecture funcionamento of mux2x1_s is 
      begin 
        Sa(7)  <= (A(7) and (not Se)) or (B(7) and Se);
        Sa(6)  <= (A(6) and (not Se)) or (B(6) and Se);
        Sa(5)  <= (A(5) and (not Se)) or (B(5) and Se);
        Sa(4)  <= (A(4) and (not Se)) or (B(4) and Se);
        Sa(3)  <= (A(3) and (not Se)) or (B(3) and Se);
        Sa(2)  <= (A(2) and (not Se)) or (B(2) and Se);
        Sa(1)  <= (A(1) and (not Se)) or (B(1) and Se);   
        Sa(0)  <= (A(0) and (not Se)) or (B(0) and Se);
        
end funcionamento;
