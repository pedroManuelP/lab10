library ieee;
use ieee.std_logic_1164.all;

entity MDE_MARCAPASSO is
   port (
			ck, rst: in std_logic;
			sa, sv, za, zv: in  std_logic;
         ta, tv: out std_logic
			);
end MDE_MARCAPASSO;

architecture logica of MDE_MARCAPASSO is
   type state_type is (rstTA, espA, contA, rstTV, espV, contV);                           
   signal y_present, y_next : state_type;

begin
   process (sa, sv, za, zv, y_present)
   begin
      case y_present is
         when rstTA =>
            y_next <= espA;
				
         when espA =>
				if sa = '1' 					  then y_next <= rstTV;
            elsif sa = '0' AND za = '1'  then y_next <= contA;
				else                         y_next <= espA; 
				end if;
				
         when contA =>
            y_next <= rstTV;
				
			when rstTV =>
				y_next <= espV;
				
			when espV =>
				if sv = '1' 					  then y_next <= rstTA;
            elsif sv = '0' AND zv = '1'  then y_next <= contV;
				else                         y_next <= espV; 
				end if;
				
			when contV =>
				y_next <= rstTA;
				
      end case;
   end process;

   process (ck, rst)
   begin
      if rst = '0' then
         y_present <= rstTA;
      elsif (ck'event and ck = '1') then
         y_present <= y_next;
      end if;
   end process;
	
   ta <= '1' when y_present = rstTA else '0';
	tv <= '1' when y_present = rstTV else '0';
end logica;