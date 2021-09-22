library ieee;
use ieee.std_logic_1164.all;

entity incremento is 
  port(A_inc:  in std_logic_vector(7 downto 0);
       Co_inc: out std_logic;
       S_inc:  out std_logic_vector(7 downto 0)
		 );
end incremento;

architecture funcionamento of incremento is
  
    component somador8bits is 
		port( A:  in std_logic_vector(7 downto 0);
				B:  in std_logic_vector(7 downto 0 );
				Ci: in std_logic;
				Co: out std_logic;
				S_MSB:  out std_logic_vector(7 downto 0));
        
  end component;
  
  
  begin
  
  SOMADOR01: somador8bits port map(
            A => A_inc,
				B => "00000001",
				Ci => '0',
				Co => Co_inc,
				S_MSB => S_inc);
  
  end funcionamento;
  
  