--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Contador14 is
	port(
		D: in std_logic_vector(13 downto 0);
		ENABLE: in std_logic;
		LOAD: in std_logic;
		ClR: in std_logic;
		UP_DW: in std_logic;
		CLK: in std_logic;
		Q: out std_logic_vector(13 downto 0)
	);

end Contador14;

--arquitetura
architecture Hardware of Contador14 is
	component Reg14_completo is
		port(
			D: in std_logic_vector(13 downto 0);
			ENABLE: in std_logic;
			CLK: in std_logic;
			CLEAR: in std_logic;
			Q: out std_logic_vector(13 downto 0)
		);

	end component;
	
	component Mux4x1_14bit is
	port(
		in3,in2,in1,in0: in std_logic_vector(13 downto 0);
		s1,s0: in std_logic;
		d: out std_logic_vector(13 downto 0)
	);
	
	end component;
	
	component somador14bits is
	port(
		A,B: in std_logic_vector (13 downto 0);
		CIN: in std_logic;
		S: out std_logic_vector (13 downto 0);
		COUT: out std_logic
	);

	end component;
	
	signal d_reg, q_reg: std_logic_vector(13 downto 0);
	signal en_reg: std_logic;
	
	signal s_inc, s_dec: std_logic_vector(13 downto 0);
	signal s1,s0: std_logic;
	signal nada1,nada2: std_logic;
begin
	Reg14: Reg14_completo port map(d_reg, ENABLE, clk, CLR, q_reg);
	Inc: somador14bits port map(q_reg,"00000000000001",'0', s_inc, nada1);
	Dec: somador14bits port map(q_reg,"11111111111110",'1', s_dec, nada2);
	Mux4x1: Mux4x1_14bit port map(q_reg, D, s_inc, s_dec, s1,s0, d_reg);
	
	s0 <= (NOT LOAD) AND (NOT UP_DW);
	s1 <= LOAD;
	
	Q <= q_reg;
end Hardware;