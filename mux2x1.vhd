library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
port(
M1, M2, S: in std_logic;
X: out std_logic
);
end mux2x1;

architecture mux2x1_arc of mux2x1 is
begin
X <= ((not S) and M1) or (S and M2);
end mux2x1_arc;