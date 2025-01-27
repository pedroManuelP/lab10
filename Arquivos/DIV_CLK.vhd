library ieee;
use ieee.std_logic_1164.all;

entity DIV_CLK is
   port (
		CLK_27M: in  std_logic;
		SW17: in std_logic;
		CLK_DIV: out std_logic
			);
			
end DIV_CLK;

architecture logica of DIV_CLK is
	component ck_div is
		port (ck_in : in  std_logic;
				ck_out: out std_logic);
	end component;

	signal clockdividido: std_logic;
begin 
	DIVISOR: ck_div port map(CLK_27M, clockdividido);
	
	CLK_DIV <= (SW17 AND clockdividido) OR (NOT SW17 AND CLK_27M);
end logica;