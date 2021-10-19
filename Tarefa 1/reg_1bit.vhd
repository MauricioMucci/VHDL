library IEEE;
use IEEE.std_logic_1164.all;

entity reg_1bit is
	port (
		dado, load, clock, clear	: in std_logic;
		q									: out std_logic
	);
end reg_1bit;

architecture archi_reg of reg_1bit is
	signal q_tmp: std_logic;
begin
	process(clock, clear)
	begin
		if clear = '1' then
			q_tmp <= '0';
		else
			if clock'EVENT and clock = '1' then
				if load = '1' then
					q_tmp <= dado;
				else
					q_tmp <= q_tmp;
				end if;
			else
				q_tmp <= q_tmp;
			end if;
		end if;
	end process;
	q		<= q_tmp;
end archi_reg;
				