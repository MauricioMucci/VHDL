library IEEE;
use IEEE.std_logic_1164.all;

entity flipflop_tipoD_Descida_CP is
	port(
			D, CLK, Clear, Preset	: in std_logic;
			Q, Q_not						: out std_logic
	);
end flipflop_tipoD_Descida_CP;

architecture archi_flipflop of flipflop_tipoD_Descida_CP is
	signal QM: std_logic;
begin
	process(CLK, Clear, Preset)
	begin
			if clear = '1' then
				QM <= '0';
			elsif preset = '1' then
				QM <= '1';
			elsif CLK'EVENT and CLK = '0' then
			-- ou rising_edge(CLK)
					QM <= D;
			else
					QM <= QM;
			end if;
	end process;
	Q 		<= QM;
	Q_not <= not QM;
end archi_flipflop;