--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity coracao is
	port(
		SW1, SW0: in std_logic;
		clk: in std_logic;
		clr: in std_logic;
		Sa,Sv: out std_logic
	);

end coracao;

--arquitetura
architecture Hardware of coracao is
	component Contador14 is
	port(
		D: in std_logic_vector(13 downto 0);
		ENABLE: in std_logic;
		LOAD: in std_logic;
		ClR: in std_logic;
		UP_DW: in std_logic;
		CLK: in std_logic;
		Q: out std_logic_vector(13 downto 0)
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
	
	component comparador14bit is
	port(
		A,B: in std_logic_vector(13 downto 0);
		
		aMaiorb_baixa: in std_logic;
		aMenorb_baixa: in std_logic;
		aIgualb_baixa: in std_logic;
		
		aMab: out std_logic;
		aMeb: out std_logic;
		aIgb: out std_logic
	);

	end component;
	
	signal nada: std_logic;
	
	signal loadsa, loadsv: std_logic;
	signal pulsoSA, pulsoSV, pulsoSV_s: std_logic_vector(13 downto 0);
	signal zerarA, zerarV: std_logic;
	signal comparadorsa: std_logic_vector(2 downto 0);
	signal comparadorsv1, comparadorsv2: std_logic_vector(2 downto 0);
begin
	ContadorSa: Contador14 port map("01101001011110", SW1, loadsa, clr, '1', clk, pulsoSA);
	zerarA <= NOT pulsosA(13) AND NOT pulsosA(12) AND NOT pulsosA(11) AND NOT pulsosA(10) AND NOT pulsosA(9) AND NOT pulsosA(8) AND NOT pulsosA(7) AND NOT pulsosA(6) AND NOT pulsosA(5) AND NOT pulsosA(4) AND NOT pulsosA(3) AND NOT pulsosA(2) AND NOT pulsosA(1) AND NOT pulsosA(0);
	loadsa <= zerarA;
	
	CompSa: comparador14bit port map(pulsosA, "01100111010110", '0', '0', '1', comparadorsa(2), comparadorsa(1), comparadorsa(0));
	Sa <= comparadorsa(2) AND SW1;
	
	
	
	ContadorSv: Contador14 port map("01101001011110", SW0, loadsv, clr, '1', clk, pulsoSV);
	zerarV <= NOT pulsoSV(13) AND NOT pulsoSV(12) AND NOT pulsoSV(11) AND NOT pulsoSV(10) AND NOT pulsoSV(9) AND NOT pulsoSV(8) AND NOT pulsoSV(7) AND NOT pulsoSV(6) AND NOT pulsoSV(5) AND NOT pulsoSV(4) AND NOT pulsoSV(3) AND NOT pulsoSV(2) AND NOT pulsoSV(1) AND NOT pulsoSV(0);
	loadsv <= zerarV;
	
	SomadorSV: somador14bits port map(pulsoSV, "00010101000110", '0', pulsoSV_s,nada);
	CompSV1: comparador14bit port map(pulsoSV_s, "01100111010110", '0', '0', '1', comparadorsv1(2), comparadorsv1(1), comparadorsv1(0));
	CompSV2: comparador14bit port map(pulsoSV_s, "01101001011111", '0', '0', '1', comparadorsv2(2), comparadorsv2(1), comparadorsv2(0));
	Sv <= ( comparadorsv1(2) AND comparadorsv2(1) ) AND SW0;
end Hardware;