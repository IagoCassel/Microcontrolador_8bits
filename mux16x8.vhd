library ieee;
use ieee.std_logic_1164.all;

entity mux16x8 is

port(
Mm1, Mm2: in std_logic_vector(7 downto 0);
Sm: in std_logic;
Xm: out std_logic_vector(7 downto 0)
);

end mux16x8;

architecture mux16x8_arc of mux16x8 is

component mux2x1 is
port(
M1, M2, S: in std_logic;
X: out std_logic
);
end component;

begin

mux0: mux2x1 port map(
M1 => Mm1(0),
M2 => Mm2(0),
S => Sm,
X => Xm(0)
);

mux1: mux2x1 port map(
M1 => Mm1(1),
M2 => Mm2(1),
S => Sm,
X => Xm(1)
);

mux2: mux2x1 port map(
M1 => Mm1(2),
M2 => Mm2(2),
S => Sm,
X => Xm(2)
);

mux3: mux2x1 port map(
M1 => Mm1(3),
M2 => Mm2(3),
S => Sm,
X => Xm(3)
);

mux4: mux2x1 port map(
M1 => Mm1(4),
M2 => Mm2(4),
S => Sm,
X => Xm(4)
);

mux5: mux2x1 port map(
M1 => Mm1(5),
M2 => Mm2(5),
S => Sm,
X => Xm(5)
);

mux6: mux2x1 port map(
M1 => Mm1(6),
M2 => Mm2(6),
S => Sm,
X => Xm(6)
);

mux7: mux2x1 port map(
M1 => Mm1(7),
M2 => Mm2(7),
S => Sm,
X => Xm(7)
);


end mux16x8_arc;