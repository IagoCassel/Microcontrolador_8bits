library ieee;
use ieee.std_logic_1164.all;

entity decremento is 
  port(A_dec:  in std_logic_vector(7 downto 0);
       S_dec:  out std_logic_vector(7 downto 0)
		 );
end decremento;

architecture funcionamento of decremento is

  component subtrator8bits is 
    port(A_sub:  in std_logic_vector(7 downto 0);
         B_sub:  in std_logic_vector(7 downto 0 );
         En_sub: in std_logic;
		   S_sub:  out std_logic_vector(7 downto 0)
		   );
		
       
  end component;
  
  
  begin
  
  SUBTRATOR01: subtrator8bits port map(
         A_sub => A_dec,
         B_sub =>"00000001",
         En_sub => '1',
		   S_sub => S_dec);
  
  end funcionamento;
  
  