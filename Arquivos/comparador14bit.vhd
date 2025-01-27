--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity comparador14bit is
	port(
		A,B: in std_logic_vector(13 downto 0);
		
		aMaiorb_baixa: in std_logic;
		aMenorb_baixa: in std_logic;
		aIgualb_baixa: in std_logic;
		
		aMab: out std_logic;
		aMeb: out std_logic;
		aIgb: out std_logic
	);

end comparador14bit;

--arquitetura
architecture comportamento of comparador14bit is
	component comparador2bit is
	port(
		a1,a0: in std_logic;
		b1,b0: in std_logic;
		
		aMaiorb_baixa: in std_logic;
		aMenorb_baixa: in std_logic;
		aIgualb_baixa: in std_logic;
		
		aMaiorb: out std_logic;
		aMenorb: out std_logic;
		aIgualb: out std_logic
	);

	end component;
	
	signal aMaiorB,aMenorb,aIgualb: std_logic_vector(6 downto 0);
begin
	comp6: comparador2bit port map(A(13),A(12),B(13),B(12), '0', '0', '1', aMaiorB(6),aMenorb(6),aIgualb(6));
	comp5: comparador2bit port map(A(11),A(10),B(11),B(10), aMaiorB(6),aMenorb(6),aIgualb(6), aMaiorB(5),aMenorb(5),aIgualb(5));
	comp4: comparador2bit port map(A(9),A(8),B(9),B(8), aMaiorB(5),aMenorb(5),aIgualb(5), aMaiorB(4),aMenorb(4),aIgualb(4));
	
	comp3: comparador2bit port map(A(7),A(6),B(7),B(6), aMaiorB(4),aMenorb(4),aIgualb(4), aMaiorB(3),aMenorb(3),aIgualb(3));
	comp2: comparador2bit port map(A(5),A(4),B(5),B(4), aMaiorB(3),aMenorb(3),aIgualb(3), aMaiorB(2),aMenorb(2),aIgualb(2));
	comp1: comparador2bit port map(A(3),A(2),B(3),B(2), aMaiorB(2),aMenorb(2),aIgualb(2), aMaiorB(1),aMenorb(1),aIgualb(1));
	comp0: comparador2bit port map(A(1),A(0),B(1),B(0), aMaiorB(1),aMenorb(1),aIgualb(1), aMaiorB(0),aMenorb(0),aIgualb(0));
	
	aMab <= aMaiorb(0);
	aMeb <= aMenorb(0);
	aIgb <= aIgualb(0);
	
end comportamento;