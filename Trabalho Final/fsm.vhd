library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity fsm is
	port (
		clk		: in std_logic;
		reset		: in std_logic;
		datain	: in std_logic_vector(7 downto 0);
		dataout	: out std_logic_vector(7 downto 0);
		overflow		: out std_logic;
		c_out		: out std_logic
	);
end fsm;

architecture archi_reg of fsm is

TYPE STATE_TYPE IS (s0, s1, s2, s3, s4, s5, s6);
SIGNAL estado_atual, proximo_estado: STATE_TYPE;

signal c : std_logic_vector(10 downto 0);
signal data_in_aux : std_logic_vector(7 downto 0);

component datapath is
	port ( 
		C			: in std_logic_vector(10 downto 0);
		CLOCK		: in std_logic;
		RESET		: in std_logic;
		DATA_IN	: in std_logic_vector(7 downto 0);
		DATA_OUT	: out std_logic_vector(7 downto 0);
		OVER		: out std_logic;
		C_OUT		: out std_logic
	);
end component;

begin

	dp : datapath port map(c, clk, reset, data_in_aux, dataout, overflow, c_out);

	process(reset, clk)
	begin
		if (reset = '1') then
			estado_atual <= s0;
		elsif (clk'EVENT and clk = '1') then
			estado_atual <= proximo_estado;
		end if;
	end process;
	
	process (estado_atual)
	begin
	
		c(2) <= '0';
		c(6) <= '1';
		c(3) <= '1';
		c(7) <= '1';
		c(9) <= '0';
		c(10) <= '0';
		case estado_atual is
			when s0 =>
				if (datain = 20) then
					data_in_aux <= "00010100";
					proximo_estado <= s1;
				else
					data_in_aux <= "00000000";
					proximo_estado <= s0;
				end if;
			when s1 =>
				if (datain = 22) then
					data_in_aux <= "00010110";
					proximo_estado <= s2;
				else
					data_in_aux <= "00000000";
					proximo_estado <= s1;
				end if;
			when s2 =>
				if (datain = 24) then
					data_in_aux <= "00011000";
					proximo_estado <= s3;
				else
					data_in_aux <= "00000000";
					proximo_estado <= s2;
				end if;
			when s3 =>
				if (datain = 26) then
					data_in_aux <= "00011010";
					proximo_estado <= s4;
				else
					data_in_aux <= "00000000";
					proximo_estado <= s3;
				end if;
			when s4 =>
				if (datain = 28) then
					data_in_aux <= "00011100";
					proximo_estado <= s5;
				else
					data_in_aux <= "00000000";
					proximo_estado <= s4;
				end if;
			when s5 =>
				if (datain = 30) then
					data_in_aux <= "00011110";
					proximo_estado <= s6;
				else
					data_in_aux <= "00000000";
					proximo_estado <= s5;
				end if;
			when s6 =>
				c(2) <= '1';
				c(6) <= '1';
				c(3) <= '1';
				c(7) <= '1';
				c(9) <= '0';
				c(10) <= '0';
				data_in_aux <= "00000000";
				proximo_estado <= s0;
		end case;
	end process;

end archi_reg;