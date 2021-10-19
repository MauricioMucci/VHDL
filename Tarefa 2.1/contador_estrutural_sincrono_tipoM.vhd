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

component flipflop_tipoD_Descida is
	port(
			D, CLK, CLEAR	: in std_logic;
			Q					: out std_logic
	);
end component;

signal saida, dado: std_logic_vector(3 downto 0);
signal reset: std_logic;
begin
	QT(0) <= saida(0);
	QT(1) <= saida(1);
	QT(2) <= saida(2);
	QT(3) <= saida(3);
	
	reset <= not(saida(3) and (not saida(2)) and (not saida(1)) and saida(0));
	
	dado(0) <= ('1' xor saida(0)) and reset;
	dado(1) <= (saida(0) xor saida(1)) and reset;
	dado(2) <= ((saida(0) and saida(1)) xor saida(2)) and reset;
	dado(3) <= ((saida(0) and saida(1) and saida(2)) xor saida(3)) and reset;
	
	ff0:	flipflop_tipoD_Descida port map(	D => dado(0),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(0));
	
	ff1:	flipflop_tipoD_Descida port map(	D => dado(1),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(1));
														
	ff2:	flipflop_tipoD_Descida port map(	D => dado(2),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(2));
														
	ff3:	flipflop_tipoD_Descida port map(	D => dado(3),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(3));
end archi_contador;