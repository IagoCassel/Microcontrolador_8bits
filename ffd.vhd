library ieee;
use ieee.std_logic_1164.all;

entity FFD is
port(

D, CLK, S, RS: in std_logic;
Q: out std_logic
);

end FFD;

architecture FFD_arc of FFD is

signal qr: std_logic;

begin

process(CLK, S, RS)
begin

if RS = '0' then qr <= '0';
elsif S = '0' then qr <= '1';
elsif (CLK'EVENT) and (CLK = '1') then
	qr <= d;
end if;
end process;

Q <= qr;

end FFD_arc;