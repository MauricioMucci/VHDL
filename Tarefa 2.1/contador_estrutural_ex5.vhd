library IEEE;
use IEEE.std_logic_1164.all;

entity contador_estrutural_ex5 is
	port(
			--T = top
			CLKT, CLEART	: in std_logic;
			ENABLER			: in std_logic;
			QT					: out std_logic_vector(3 downto 0)
	);
end contador_estrutural_ex5;

architecture archi_contador of contador_estrutural_ex5 is

component flipflop_tipoD_Subida is
	port(
			D, CLK, CLEAR	: in std_logic;
			Q					: out std_logic
	);
end component;

signal saida, updown, dado_up, dado_down: std_logic_vector(3 downto 0);
signal reset, preset: std_logic;
begin

	with ENABLER select updown <= dado_up when '0',
											dado_down when '1';
	QT(0) <= saida(0);
	QT(1) <= saida(1);
	QT(2) <= saida(2);
	QT(3) <= saida(3);
	
	reset <= not(saida(3) and (not saida(2)) and (not saida(1)) and saida(0));
	
	dado_up(0) <= ('1' xor saida(0)) and reset;
	dado_up(1) <= (saida(0) xor saida(1)) and reset;
	dado_up(2) <= ((saida(0) and saida(1)) xor saida(2)) and reset;
	dado_up(3) <= ((saida(0) and saida(1) and saida(2)) xor saida(3)) and reset;
	
	dado_down(0) <= '1' when saida = "0000" else '1' xor saida(0);
	dado_down(1) <= '0' when saida = "0000" else not(saida(0) xor saida(1));
	dado_down(2) <= '0' when saida = "0000" else ((not saida(0)) and (not saida(1))) xor saida(2);
	dado_down(3) <= '1' when saida = "0000" else ((not saida(0)) and (not saida(1)) and (not saida(2))) xor saida(3);
	
	ff0:	flipflop_tipoD_Subida port map(	D => updown(0),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(0));
	
	ff1:	flipflop_tipoD_Subida port map(	D => updown(1),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(1));
														
	ff2:	flipflop_tipoD_Subida port map(	D => updown(2),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(2));
														
	ff3:	flipflop_tipoD_Subida port map(	D => updown(3),
														CLK => CLKT,
														CLEAR => CLEART,
														Q => saida(3));
end archi_contador;