library ieee;
use ieee.std_logic_1164.all;

entity ULA is
  port(A_ula: in std_logic_vector(7 downto 0);
		 B_ula: in std_logic_vector(7 downto 0);
		 Se_ula: in std_logic_vector(3 downto 0);
		 Out_ula: out std_logic_vector(7 downto 0);
		 led_ovf_sum: out std_logic;
		 led_ovf_mult: out std_logic;
		 led_ovf_inc: out std_logic;
		 jump_eq: out std_logic;
		 jump_hi: out std_logic;
		 jump_lo: out std_logic);
		 
end ULA;


 architecture arrangement of ULA is
 
 component somador8bits is 
  port(A:  in std_logic_vector(7 downto 0);
       B:  in std_logic_vector(7 downto 0 );
       Ci: in std_logic;
       Co: out std_logic;
       S_MSB:  out std_logic_vector(7 downto 0)
		 );
		
 end component;
	
 component subtrator8bits is 
    port(A_sub:  in std_logic_vector(7 downto 0);
         B_sub:  in std_logic_vector(7 downto 0 );
         En_sub: in std_logic;
		   S_sub:  out std_logic_vector(7 downto 0)
		   );
		
       
   end component;
    
 component mux8x16x8 is
	port(
			INm_8_0, INm_8_1, INm_8_2, INm_8_3, 
			INm_8_4, INm_8_5, INm_8_6, INm_8_7, 
			INm_8_8, INm_8_9, INm_8_10, INm_8_11, 
			INm_8_12, INm_8_13, INm_8_14, INm_8_15 : in std_logic_vector(7 downto 0);
			ENm_8x16x8: in std_logic;
			SELm_8x16x8: in std_logic_vector(3 downto 0);
			OUTm_8x16x8: out std_logic_vector(7 downto 0)
			);

   end component;

 component decremento is 
  port(A_dec:  in std_logic_vector(7 downto 0);
       S_dec:  out std_logic_vector(7 downto 0)
		 );
   end component;
 
 component incremento is 
  port(A_inc:  in std_logic_vector(7 downto 0);
       Co_inc: out std_logic;
       S_inc:  out std_logic_vector(7 downto 0)
		 );
   end component;
 
 component SHR is 
  port(A_shr:  in std_logic_vector(7 downto 0);
       S_shr:  out std_logic_vector(7 downto 0)
		 );
   end component;
 
 component SHL is 
  port(A_shl:  in std_logic_vector(7 downto 0);
       S_shl:  out std_logic_vector(7 downto 0)
		 );
   end component;
 
 component comparador is 
  port(A,B: in std_logic_vector(7 downto 0);
       eq,bt,lt: out std_logic);
       
   end component;
	
 component multiplicador is 
  port (A_M: in std_logic_vector(7 downto 0); 
        B_M: in std_logic_vector(7 downto 0);
        S_M: out std_logic_vector(15 downto 0));
        
 end component;

 
 signal car_out, signal_carry_inc, comp_sum_flag, comp_mult_flag: std_logic;
 signal signal_out_sum, signal_out_sub, signal_out_mult_P1, signal_out_mult_P2, signal_out_inc, signal_out_dec,
 signal_and, signal_not, signal_xor, signal_or, signal_out_shr, signal_out_shl: std_logic_vector(7 downto 0);
 signal out_comp: std_logic_vector(7 downto 0);
 signal signal_out_mult: std_logic_vector(15 downto 0);
 
 begin
 
 SOMADOR1: somador8bits port map(
		 A => A_ula,
       B => B_ula,
       Ci => '0',
       Co => car_out,
       S_MSB => signal_out_sum);
		 
 SUBTRATOR1: subtrator8bits port map(
		A_sub => A_ula,
      B_sub => B_ula,
      En_sub => '1',
      S_sub => signal_out_sub);
		
 COMP: comparador port map(
	   A => A_ula,
		B => B_ula,
      eq => out_comp(2),
		bt => out_comp(1),
		lt => out_comp(0));
 
 out_comp(7) <= '0'; 
 out_comp(6) <= '0'; 
 out_comp(5) <= '0'; 
 out_comp(4) <= '0';
 out_comp(3) <= '0';  
 jump_eq <= out_comp(2);
 jump_hi <= out_comp(1);
 jump_lo <= out_comp(0);
 
 MULT: multiplicador port map(
		 A_M => A_ula,
       B_M => B_ula,
       S_M => signal_out_mult);
		 
 signal_out_mult_P1 <= signal_out_mult(15 downto 8);
 signal_out_mult_P2 <= signal_out_mult(7 downto 0);
 
 INC: incremento port map(
      A_inc => A_ula,
      Co_inc => signal_carry_inc,
      S_inc => signal_out_inc); 
 
 DEC: decremento port map(
      A_dec => A_ula,
      S_dec => signal_out_dec); 


 signal_and <= A_ula and B_ula;
 signal_or <= A_ula or B_ula;
 signal_xor <= A_ula xor B_ula;
 signal_not <= not A_ula; 
 
 SHR01: SHR port map(
        A_shr => A_ula,
        S_shr => signal_out_shr);
 
 SHL01: SHL port map(
        A_shl => A_ula,
        S_shl => signal_out_shl);
  
 led_ovf_mult <= signal_out_mult_P1(7) or signal_out_mult_P1(6)or signal_out_mult_P1(5) or signal_out_mult_P1(4) or signal_out_mult_P1(3) or signal_out_mult_P1(2) or signal_out_mult_P1(1) or signal_out_mult_P1(0);
 led_ovf_sum <= car_out;
 led_ovf_inc <= signal_carry_inc;
		  
	  
   
 MUXULA01: mux8x16x8 port map(
			  INm_8_0 => signal_out_sum,
			  INm_8_1 => signal_out_sub,
			  INm_8_2 => out_comp,
			  INm_8_3 => signal_out_mult_P2,
			  INm_8_4 => signal_out_inc,
			  INm_8_5 => signal_out_dec,
			  INm_8_6 => signal_and,
			  INm_8_7 => signal_or,
			  INm_8_8 => signal_xor,
			  INm_8_9 => signal_not,
			  INm_8_10 => signal_out_shl,
			  INm_8_11 => signal_out_shr,
			  INm_8_12 => "00000000",
			  INm_8_13 => "00000000",
			  INm_8_14 => "00000000",
			  INm_8_15 => "00000000",
			  ENm_8x16x8 => '1',
			  SELm_8x16x8 => Se_ula,
			  OUTm_8x16x8 => out_ula);
			  
 
 
end arrangement; 