library IEEE;
use IEEE.std_logic_1164.all;

entity reg_4bit is
	port (
		D, CLK		: in std_logic;
		QR				: out std_logic
	);
end reg_4bit;

architecture archi_reg of reg_4bit is	
	signal a, b, c, q: std_logic;
begin
	process(CLK, C)
	begin
		if CLK'EVENT and CLK = '1' then
			a <= d;
			b <= a;
			c <= b;
			q <= c;
		else
			q <= q;
		end if;
	end process;
	QR <= q;
end archi_reg;		