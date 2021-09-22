library ieee;
use ieee.std_logic_1164.all;

entity mux34x17 is

port(
Mm1, Mm2: in std_logic_vector(16 downto 0);
Sm: in std_logic;
Xm: out std_logic_vector(16 downto 0)
);

end mux34x17;

architecture mux34x17_arc of mux34x17 is

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

mux8: mux2x1 port map(
M1 => Mm1(8),
M2 => Mm2(8),
S => Sm,
X => Xm(8)
);

mux9: mux2x1 port map(
M1 => Mm1(9),
M2 => Mm2(9),
S => Sm,
X => Xm(9)
);

mux10: mux2x1 port map(
M1 => Mm1(10),
M2 => Mm2(10),
S => Sm,
X => Xm(10)
);

mux11: mux2x1 port map(
M1 => Mm1(11),
M2 => Mm2(11),
S => Sm,
X => Xm(11)
);

mux12: mux2x1 port map(
M1 => Mm1(12),
M2 => Mm2(12),
S => Sm,
X => Xm(12)
);

mux13: mux2x1 port map(
M1 => Mm1(13),
M2 => Mm2(13),
S => Sm,
X => Xm(13)
);

mux14: mux2x1 port map(
M1 => Mm1(14),
M2 => Mm2(14),
S => Sm,
X => Xm(14)
);

mux15: mux2x1 port map(
M1 => Mm1(15),
M2 => Mm2(15),
S => Sm,
X => Xm(15)
);

mux16: mux2x1 port map(
M1 => Mm1(16),
M2 => Mm2(16),
S => Sm,
X => Xm(16)
);

end mux34x17_arc;