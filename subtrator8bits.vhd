library ieee;
use ieee.std_logic_1164.all;

entity subtrator8bits is 
  port(A_sub:  in std_logic_vector(7 downto 0);
       B_sub:  in std_logic_vector(7 downto 0 );
       En_sub: in std_logic;
		 S_sub:  out std_logic_vector(7 downto 0)
		 );
		
       
end subtrator8bits;

architecture arrangement of subtrator8bits is
   
  component somador8bits is 
		port( A:  in std_logic_vector(7 downto 0);
				B:  in std_logic_vector(7 downto 0 );
				Ci: in std_logic;
				Co: out std_logic;
				S_MSB:  out std_logic_vector(7 downto 0));
        
  end component;
  
   component mux2x1_s is 
      port(A: in std_logic_vector(7 downto 0);
           B: in std_logic_vector(7 downto 0);
           Se: in std_logic ; 
           Sa: out std_logic_vector(7 downto 0));
         
	end component;
      
    
  signal not_B, out_mux: std_logic_vector(7 downto 0);
  signal co_sub: std_logic;
  
  
  
	begin
    
  
	  MUX01: mux2x1_s port map(
				A => B_sub,
				B => not B_sub,
				Se => En_sub,
				Sa => out_mux); 
	  
	  
	  
	  SUBTRATOR01: somador8bits port map(
					A => A_sub,
					B => out_mux,
					Ci => En_sub, --talvez colocar not en_sub por causa da flag--
					Co => co_sub,
					S_MSB => S_sub);
	  
  
 end arrangement;   
                    
  
  
  
  
  