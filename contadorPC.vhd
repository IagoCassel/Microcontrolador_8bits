library ieee;
use ieee.std_logic_1164.all;

entity contadorPC is
  port (cont_func: in std_logic_vector(7 downto 0);
        PC_ld_cont: in std_logic;
        PC_inc_cont: in std_logic;
		  PC_clr_cont: in std_logic;
		  CLK_PC: in std_logic;
        pc_out: out std_logic_vector(7 downto 0));
        
end contadorPC;

architecture arrangement of contadorPC is
   
  component somador8bits is 
  port(A:  in std_logic_vector(7 downto 0);
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
  
  component eight_bit_register is

	port(
			De: in std_logic_vector(7 downto 0); 
			CLKe, Se, RSe, ENe: in std_logic;
			Qe: out std_logic_vector(7 downto 0));

  end component;
  
   signal signal_out_reg, out_sum, out_mux: std_logic_vector(7 downto 0);
	signal carry_out: std_logic;
   begin
	
	
	somador01: somador8bits port map(
	          A => signal_out_reg,
				 B => "00000001",
				 Ci => '0',
				 Co => carry_out,
				 S_MSB => out_sum );
			
			
	
	MUX: mux2x1_s port map(
	      A => out_sum,
         B => cont_func,
         Se => Pc_ld_cont,
         Sa => out_mux);
			
	REG: eight_bit_register port map(
	      De => out_mux,
			CLKe => clk_PC,
			Se => '1',
			RSe => PC_clr_cont,
			ENe => Pc_inc_cont, 
			Qe => signal_out_reg);
	
	
	pc_out <= signal_out_reg;
 	 
  
end arrangement;