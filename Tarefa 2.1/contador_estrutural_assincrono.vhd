library IEEE;
use IEEE.std_logic_1164.all;

entity contador_estrutural_assincrono is
	port(
			--T = top
			CLKT, CLEART	: in std_logic;
			QT					: out std_logic_vector(3 downto 0)
	);
end contador_estrutural_assincrono;

architecture archi_contador of contador_estrutural_assincrono is

component flipflop_tipoD_Subida is
	port(
			D, CLK, CLEAR	: in std_logic;
			Q, Q_not			: out std_logic
	);
end component;

signal tmp: std_logic_vector(3 downto 0);

begin
	ff0:	flipflop_tipoD_Subida port map(	D => tmp(0),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => QT(0),
														Q_not	=> tmp(0));
	
	ff1:	flipflop_tipoD_Subida port map(	D => tmp(1),
														CLK => tmp(0),
														CLEAR => CLEART,
														Q => QT(1),
														Q_not	=> tmp(1));
														
	ff2:	flipflop_tipoD_Subida port map(	D => tmp(2),
														CLK => tmp(1),
														CLEAR => CLEART,
														Q => QT(2),
														Q_not	=> tmp(2));
														
	ff3:	flipflop_tipoD_Subida port map(	D => tmp(3),
														CLK => tmp(2),
														CLEAR => CLEART,
														Q => QT(3),
														Q_not	=> tmp(3));
end archi_contador;