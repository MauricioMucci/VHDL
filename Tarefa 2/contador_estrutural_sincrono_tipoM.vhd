library IEEE;
use IEEE.std_logic_1164.all;

entity contador_estrutural_sincrono_tipoM is
	port(
			--T = top
			CLKT, CLEART	: in std_logic;
			QT					: out std_logic_vector(3 downto 0)
	);
end contador_estrutural_sincrono_tipoM;

architecture archi_contador of contador_estrutural_sincrono_tipoM is

component flipflop_tipoD_Subida is
	port(
			D, CLK, CLEAR	: in std_logic;
			Q, Q_not			: out std_logic
	);
end component;

signal saida, not_saida, dado: std_logic_vector(3 downto 0);

begin
	QT(0) <= saida(0);
	QT(1) <= saida(1);
	QT(2) <= saida(2);
	QT(3) <= saida(3);
	
	dado(0) <= '1' xor saida(0);
	dado(1) <= saida(0) xor saida(1);
	dado(2) <= (saida(0) and saida(1)) xor saida(2);
	dado(3) <= (saida(0) and saida(1) and saida(2)) xor saida(3);
	
	ff0:	flipflop_tipoD_Subida port map(	D => dado(0),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(0),
														Q_not => not_saida(0));
	
	ff1:	flipflop_tipoD_Subida port map(	D => dado(1),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(1),
														Q_not => not_saida(1));
														
	ff2:	flipflop_tipoD_Subida port map(	D => dado(2),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(2),
														Q_not => not_saida(2));
														
	ff3:	flipflop_tipoD_Subida port map(	D => dado(3),
														CLK => dado(2),
														CLEAR => CLEART,
														Q => saida(3),
														Q_not => not_saida(3));
end archi_contador;