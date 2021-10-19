library IEEE;
use IEEE.std_logic_1164.all;

entity flipflop_tipoD_Descida is
	port(
			D, CLK, CLEAR	: in std_logic;
			Q					: out std_logic
	);
end flipflop_tipoD_Descida;

architecture archi_flipflop of flipflop_tipoD_Descida is
	signal QM: std_logic;
begin
	process(CLK)
	begin
		if CLEAR = '1' then
			QM <= '0';
		elsif CLK'EVENT and CLK = '0' then
			QM <= D;
		else
			QM <= QM;
		end if;
	end process;
	Q <= QM;
end archi_flipflop;