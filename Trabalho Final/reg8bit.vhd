library IEEE;
use IEEE.std_logic_1164.all;

entity reg8bit is
	port (
		D		: in std_logic_vector(7 downto 0);
		CLK	: in std_logic;
		LOAD	: in std_logic;
		CLEAR	: in std_logic;
		Q		: out std_logic_vector(7 downto 0)
	);
end reg8bit;

architecture archi_reg of reg8bit is
signal Q_TMP: std_logic_vector(7 downto 0);
begin

	FF7:	process(CLK, CLEAR)
			begin
				if CLEAR = '1' then
					Q_TMP(7) <= '0';
				elsif CLK'event and CLK = '1' then
					if LOAD = '1' then
						Q_TMP(7) <= D(7);
					else
						Q_TMP(7) <= Q_TMP(7);
					end if;
				else
					Q_TMP(7) <= Q_TMP(7);
				end if;
			end process;

	FF6:	process(CLK, CLEAR)
			begin
				if CLEAR = '1' then
					Q_TMP(6) <= '0';
				elsif CLK'event and CLK = '1' then
					if LOAD = '1' then
						Q_TMP(6) <= D(6);
					else
						Q_TMP(6) <= Q_TMP(6);
					end if;
				else
					Q_TMP(6) <= Q_TMP(6);
				end if;
			end process;

	FF5:	process(CLK, CLEAR)
			begin
				if CLEAR = '1' then
					Q_TMP(5) <= '0';
				elsif CLK'event and CLK = '1' then
					if LOAD = '1' then
						Q_TMP(5) <= D(5);
					else
						Q_TMP(5) <= Q_TMP(5);
					end if;
				else
					Q_TMP(5) <= Q_TMP(5);
				end if;
			end process;

	FF4:	process(CLK, CLEAR)
			begin
				if CLEAR = '1' then
					Q_TMP(4) <= '0';
				elsif CLK'event and CLK = '1' then
					if LOAD = '1' then
						Q_TMP(4) <= D(4);
					else
						Q_TMP(4) <= Q_TMP(4);
					end if;
				else
					Q_TMP(4) <= Q_TMP(4);
				end if;
			end process;

	FF3:	process(CLK, CLEAR)
			begin
				if CLEAR = '1' then
					Q_TMP(3) <= '0';
				elsif CLK'event and CLK = '1' then
					if LOAD = '1' then
						Q_TMP(3) <= D(3);
					else
						Q_TMP(3) <= Q_TMP(3);
					end if;
				else
					Q_TMP(3) <= Q_TMP(3);
				end if;
			end process;
			
	FF2:	process(CLK, CLEAR)
			begin
				if CLEAR = '1' then
					Q_TMP(2) <= '0';
				elsif CLK'event and CLK = '1' then
					if LOAD = '1' then
						Q_TMP(2) <= D(2);
					else
						Q_TMP(2) <= Q_TMP(2);
					end if;
				else
					Q_TMP(2) <= Q_TMP(2);
				end if;
			end process;
			
	FF1:	process(CLK, CLEAR)
			begin
				if CLEAR = '1' then
					Q_TMP(1) <= '0';
				elsif CLK'event and CLK = '1' then
					if LOAD = '1' then
						Q_TMP(1) <= D(1);
					else
						Q_TMP(1) <= Q_TMP(1);
					end if;
				else
					Q_TMP(1) <= Q_TMP(1);
				end if;
			end process;
			
	FF0:	process(CLK, CLEAR)
			begin
				if CLEAR = '1' then
					Q_TMP(0) <= '0';
				elsif CLK'event and CLK = '1' then
					if LOAD = '1' then
						Q_TMP(0) <= D(0);
					else
						Q_TMP(0) <= Q_TMP(0);
					end if;
				else
					Q_TMP(0) <= Q_TMP(0);
				end if;
			end process;
			
	Q <= Q_TMP;

end archi_reg;