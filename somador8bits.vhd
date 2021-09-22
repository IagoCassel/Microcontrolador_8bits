library ieee;
use ieee.std_logic_1164.all;

entity somador8bits is 
  port(A:  in std_logic_vector(7 downto 0);
       B:  in std_logic_vector(7 downto 0 );
       Ci: in std_logic;
       Co: out std_logic;
       S_MSB:  out std_logic_vector(7 downto 0)
		 );
		
end somador8bits;
 
 architecture arrangement of somador8bits is
   
   component somador is
      port (a: in std_logic;
            b: in std_logic;
            ci: in std_logic;
            co: out std_logic;
            s: out std_logic);
        
   end component;
   
      signal carry_out: std_logic_vector(0 to 6) ;
     
     begin
        
        SOMADOR01: somador port map(
          a => A(0),
          b => B(0),
          ci => Ci,
          co => carry_out(0),
          s => S_MSB(0));
          
        SOMADOR02: somador port map(
          a => A(1),
          b => B(1),
          ci => carry_out(0),
          co => carry_out(1),
          s => S_MSB(1));
          
           
        SOMADOR03: somador port map(
          a => A(2),
          b => B(2),
          ci => carry_out(1),
          co => carry_out(2),
          s => S_MSB(2));
          
             
        SOMADOR04: somador port map(
          a => A(3),
          b => B(3),
          ci => carry_out(2),
          co => carry_out(3),
          s => S_MSB(3));
        
        SOMADOR05: somador port map(
          a => A(4),
          b => B(4),
          ci => carry_out(3),
          co => carry_out(4),
          s => S_MSB(4));
          
       SOMADOR06: somador port map(
          a => A(5),
          b => B(5),
          ci => carry_out(4),
          co => carry_out(5),
          s => S_MSB(5));
        
        SOMADOR07: somador port map(
          a => A(6),
          b => B(6),
          ci => carry_out(5),
          co => carry_out(6),
          s => S_MSB(6));
        
        SOMADOR08: somador port map(
          a => A(7),
          b => B(7),
          ci => carry_out(6),
          co => Co,
          s => S_MSB(7));
        
             
               
end arrangement;   
                    
          
          

          
          
          
   
   
   
   
