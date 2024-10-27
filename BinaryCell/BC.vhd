library ieee;
use ieee.std_logic_1164.all;

entity BC is
    port(
        input     : in std_logic;      -- Input data
        selecti    : in std_logic;      -- Select signal to enable the cell
        readWrite : in std_logic;      -- Read/Write control signal (1 for Write, 0 for Read)
        output    : out std_logic      -- Output signal
    );
end BC;

architecture Behavioral of BC is
    signal Q, QN : std_logic := '0'; -- Q and Q' for the latch
begin
    process (input, selecti, readWrite)
    begin
       if selecti = '1' then
			
			if readWrite = '0' then
				Q <= input;
				output <= '0';
			elsif readWrite = '1' then
				output <= Q;
			end if;
		
		else
			output <= '0'; 
		 end if;

    end process;
end Behavioral;
