library ieee;
use ieee.std_logic_1164.all;

entity somador is
  port (a: in std_logic;
        b: in std_logic;
        ci: in std_logic;
        co: out std_logic;
        s: out std_logic );
        
end somador;


architecture funcionamento of somador is
  begin
  
  co <= (b and ci) or (a and ci) or (a and b);
  s <= a xor b xor ci;
  
end funcionamento; 
  
  
