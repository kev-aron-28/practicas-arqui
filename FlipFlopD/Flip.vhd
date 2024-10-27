library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_flip_flop is
    Port (
        D      : in  STD_LOGIC;    -- Entrada de datos
        clk    : in  STD_LOGIC;
        Q      : inout STD_LOGIC;    -- Salida del flip-flop
        QN     : inout STD_LOGIC     -- Salida complementaria
    );
end D_flip_flop;

architecture Behavioral of D_flip_flop is
	 begin
    process(clk, D, Q)
    begin
        if rising_edge(clk) then
            Q <= (D nand clk) nand QN;
				QN <= (not D nand clk) nand Q;
        end if;
    end process;
end Behavioral;
