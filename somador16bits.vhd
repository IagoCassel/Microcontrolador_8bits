library ieee;
use ieee.std_logic_1164.all;

entity somador16std_logics is 
  port(A:  in std_logic_vector(15 downto 0);
       B:  in std_logic_vector(15 downto 0 );
       Ci: in std_logic;
       Co: out std_logic;
       S:  out std_logic_vector(15 downto 0));
       
end somador16std_logics;
 
 architecture arrangement of somador16std_logics is
   
   component somador is
      port (a: in std_logic;
            b: in std_logic;
            ci: in std_logic;
            co: out std_logic;
            s: out std_logic);
        
   end component;
   
      signal carry_out: std_logic_vector(0 to 14) ;
     
     begin
        
        SOMADOR01: somador port map(
          a => A(0),
          b => B(0),
          ci => Ci,
          co => carry_out(0),
          s => S(0));
          
        SOMADOR02: somador port map(
          a => A(1),
          b => B(1),
          ci => carry_out(0),
          co => carry_out(1),
          s => S(1));
          
           
        SOMADOR03: somador port map(
          a => A(2),
          b => B(2),
          ci => carry_out(1),
          co => carry_out(2),
          s => s(2));
          
             
        SOMADOR04: somador port map(
          a => A(3),
          b => B(3),
          ci => carry_out(2),
          co => carry_out(3),
          s => S(3));
        
        SOMADOR05: somador port map(
          a => A(4),
          b => B(4),
          ci => carry_out(3),
          co => carry_out(4),
          s => S(4));
          
       SOMADOR06: somador port map(
          a => A(5),
          b => B(5),
          ci => carry_out(4),
          co => carry_out(5),
          s => S(5));
        
        SOMADOR07: somador port map(
          a => A(6),
          b => B(6),
          ci => carry_out(5),
          co => carry_out(6),
          s => S(6));
        
        SOMADOR08: somador port map(
          a => A(7),
          b => B(7),
          ci => carry_out(6),
          co => carry_out(7),
          s => S(7));
        
        SOMADOR09: somador port map(
          a => A(8),
          b => B(8),
          ci => carry_out(7),
          co => carry_out(8),
          s => S(8));
        
        SOMADOR10: somador port map(
          a => A(9),
          b => B(9),
          ci => carry_out(8),
          co => carry_out(9),
          s => S(9));
        
        SOMADOR11: somador port map(
          a => A(10),
          b => B(10),
          ci => carry_out(9),
          co => carry_out(10),
          s => S(10));
        
        SOMADOR12: somador port map(
          a => A(11),
          b => B(11),
          ci => carry_out(10),
          co => carry_out(11),
          s => S(11));
          
        SOMADOR13: somador port map(
          a => A(12),
          b => B(12),
          ci => carry_out(11),
          co => carry_out(12),
          s => S(12));
        
        SOMADOR14: somador port map(
          a => A(13),
          b => B(13),
          ci => carry_out(12),
          co => carry_out(13),
          s => S(13));
        
        SOMADOR15: somador port map(
          a => A(14),
          b => B(14),
          ci => carry_out(13),
          co => carry_out(14),
          s => S(14));
        
        SOMADOR16: somador port map(
          a => A(15),
          b => B(15),
          ci => carry_out(14),
          co => Co,
          s => S(15));
        
               
end arrangement;   
                    
          
          

          
          
          
   
   
   
   
