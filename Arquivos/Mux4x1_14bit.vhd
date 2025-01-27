--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Mux4x1_14bit is
	port(
		in3,in2,in1,in0: in std_logic_vector(13 downto 0);
		s1,s0: in std_logic;
		d: out std_logic_vector(13 downto 0)
	);

end Mux4x1_14bit;

--arquitetura
architecture Hardware of Mux4x1_14bit is
	component Mux4x1 is
		port(
			in3,in2,in1,in0: in std_logic;
			s1,s0: in std_logic;
			d: out std_logic
		);
	end component;

begin
	mux0: Mux4x1 port map(in3(0),in2(0),in1(0),in0(0),s1,s0,d(0));
	mux1: Mux4x1 port map(in3(1),in2(1),in1(1),in0(1),s1,s0,d(1));
	mux2: Mux4x1 port map(in3(2),in2(2),in1(2),in0(2),s1,s0,d(2));
	mux3: Mux4x1 port map(in3(3),in2(3),in1(3),in0(3),s1,s0,d(3));
	mux4: Mux4x1 port map(in3(4),in2(4),in1(4),in0(4),s1,s0,d(4));
	mux5: Mux4x1 port map(in3(5),in2(5),in1(5),in0(5),s1,s0,d(5));
	mux6: Mux4x1 port map(in3(6),in2(6),in1(6),in0(6),s1,s0,d(6));
	
	mux7: Mux4x1 port map(in3(7),in2(7),in1(7),in0(7),s1,s0,d(7));
	mux8: Mux4x1 port map(in3(8),in2(8),in1(8),in0(8),s1,s0,d(8));
	mux9: Mux4x1 port map(in3(9),in2(9),in1(9),in0(9),s1,s0,d(9));
	mux10: Mux4x1 port map(in3(10),in2(10),in1(10),in0(10),s1,s0,d(10));
	mux11: Mux4x1 port map(in3(11),in2(11),in1(11),in0(11),s1,s0,d(11));
	mux12: Mux4x1 port map(in3(12),in2(12),in1(12),in0(12),s1,s0,d(12));
	mux13: Mux4x1 port map(in3(13),in2(13),in1(13),in0(13),s1,s0,d(13));
end Hardware;