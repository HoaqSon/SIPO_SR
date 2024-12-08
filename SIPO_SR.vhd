library ieee;
use ieee.std_logic_1164.all;

entity SIPO_SR is --Serial-In Parallel-Out Shift Register
	port( Data_in : in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			Q : out std_logic_vector(3 downto 0);
			Qn : out std_logic_vector(3 downto 0));
end SIPO_SR;

architecture behavioral of SIPO_SR is
	signal Q0, Q1, Q2, Q3 : std_logic;
	begin
		IC0 : entity work.D_FF
				port map( D => Data_in,
							 clk => clk,
							 reset => reset,
							 Q => Q0);
		IC1 : entity work.D_FF
				port map( D => Q0,
							 clk => clk,
							 reset => reset,
							 Q => Q1);
		IC2 : entity work.D_FF
				port map( D => Q1,
							 clk => clk,
							 reset => reset,
							 Q => Q2);
		IC3 : entity work.D_FF
				port map( D => Q2,
							 clk => clk,
							 reset => reset,
							 Q => Q3);
							 
		Q(0) <= Q0;
		Q(1) <= Q1;
		Q(2) <= Q2;
		Q(3) <= Q3;
		Qn(0) <= not Q0;
		Qn(1) <= not Q1;
		Qn(2) <= not Q2;
		Qn(3) <= not Q3;
		
	end behavioral;
	