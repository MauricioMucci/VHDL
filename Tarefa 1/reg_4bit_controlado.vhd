library IEEE;
use IEEE.std_logic_1164.all;

entity reg_4bit_controlado is
	port (
		D						: std_logic_vector(3 downto 0);
		L						: std_logic_vector(1 	 downto 0);
		DSE, DSD, CLK, C	: in std_logic;
		Q						: out std_logic_vector(3 downto 0)
	);
end reg_4bit_controlado;

architecture archi_reg of reg_4bit_controlado is
	signal QM: std_logic_vector(3 downto 0);
begin
	Reg3: process(CLK, C)
			begin
				if C = '1' then
					QM(3) <= '0';
				else
					if CLK'EVENT and CLK = '1' then
						if L = "11" then
							QM(3) <= D(3);
						elsif L = "00" then
							QM(3) <= QM(3);
						elsif L = "01" then
							QM(3) <= QM(2);
						elsif L = "10" then
							QM(3) <= DSD;
						end if;
					else
						QM(3) <= QM(3);
					end if;
				end if;
			end process;
	Reg2: process(CLK, C)
			begin
				if C = '1' then
					QM(2) <= '0';
				else
					if CLK'EVENT and CLK = '1' then
						if L = "11" then
							QM(2) <= D(2);
						elsif L = "00" then
							QM(2) <= QM(2);
						elsif L = "01" then
							QM(2) <= QM(1);
						elsif L = "10" then
							QM(2) <= QM(3);
						end if;
					else
						QM(2) <= QM(2);
					end if;
				end if;
			end process;
	Reg1: process(CLK, C)
			begin
				if C = '1' then
					QM(1) <= '0';
				else
					if CLK'EVENT and CLK = '1' then
						if L = "11" then
							QM(1) <= D(1);
						elsif L = "00" then
							QM(1) <= QM(1);
						elsif L = "01" then
							QM(1) <= QM(0);
						elsif L = "10" then
							QM(1) <= QM(2);
						end if;
					else
						QM(1) <= QM(1);
					end if;
				end if;
			end process;
	Reg0: process(CLK, C)
			begin
				if C = '1' then
					QM(0) <= '0';
				else
					if CLK'EVENT and CLK = '1' then
						if L = "11" then
							QM(0) <= D(0);
						elsif L = "00" then
							QM(0) <= QM(0);
						elsif L = "01" then
							QM(0) <= DSE;
						elsif L = "10" then
							QM(0) <= QM(1);
						end if;
					else
						QM(0) <= QM(0);
					end if;
				end if;
			end process;
			Q(3) <= QM(3);
			Q(2) <= QM(2);
			Q(1) <= QM(1);
			Q(0) <= QM(0);
end archi_reg;