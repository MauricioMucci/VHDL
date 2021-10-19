library IEEE;
use IEEE.std_logic_1164.all;

entity flipflop_tipoD_Subida is
	port(
			D, CLK, CLEAR	: in std_logic;
			Q, Q_not			: out std_logic
	);
end flipflop_tipoD_Subida;

architecture archi_flipflop of flipflop_tipoD_Subida is
	signal QM: std_logic;
begin
	process(CLK)
	begin
		if CLEAR = '1' then
			QM <= '0';
		else
			if CLK'EVENT and CLK = '1' then
				QM <= D;
			else
				QM <= QM;
			end if;
		end if;
	end process;
	Q 		<= QM;
	Q_not <= not QM;
end archi_flipflop;