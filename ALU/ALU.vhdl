library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( Z : in  STD_LOGIC_VECTOR (2 downto 0);
           Acin : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           R : out  STD_LOGIC_VECTOR (1 downto 0);
           Cout : out STD_LOGIC
         );
end ALU;

architecture Behavioral of ALU is
begin
    process (Z, Acin, A, B)
	 variable sum : STD_LOGIC_VECTOR(2 downto 0);
    begin
        case Z is
            when "000" =>
                -- R = A or B
                R(0) <= A(0) or B(0);
                R(1) <= A(1) or B(1);
                Cout <= '0';
            when "001" =>
                -- R = A xor B
                R(0) <= A(0) xor B(0);
                R(1) <= A(1) xor B(1);
                Cout <= '0';

            when "010" =>
                -- R = A and B
                R(0) <= A(0) and B(0);
                R(1) <= A(1) and B(1);
                Cout <= '0';

            when "011" =>
                -- R = not A
                R(0) <= not A(0);
                R(1) <= not A(1);
                Cout <= '0';
					 
            when "100" =>
                -- R = A
                if Acin = '0' then
                    R <= A;
                else
                    -- R = A + 1
                    sum := ('0' & A) + "001";
                    R(0) <= sum(0);
						  R(1) <= sum(1);
                    Cout <= sum(2);
                end if;
            when "101" =>
                -- R = A + B
                if Acin = '0' then
                    sum := ('0' & A) + ('0' & B);
                    R <= sum(1 downto 0);
                    Cout <= sum(2);
                else 
                    -- R = A + B + 1
                    sum := ('0' & A) + ('0' & B) + ("00" & Acin);
                    R <= sum(1 downto 0);
                    Cout <= sum(2);
                end if;

            when "110" =>
                -- A - B - 1 
                if Acin = '0' then
                    sum := ('0' & A) - ('0' & B) - ("001");
                    R <= sum(1 downto 0);
                    Cout <= sum(2);
                else 
                    -- A - B
                    sum := ('0' & A) - ('0' & B);
                    R <= sum(1 downto 0);
                    Cout <= sum(2);
                end if;

            when "111" =>
                -- A - 1
                if Acin = '0' then
                    sum := ('0' & A) - ("001");
                    R <= sum(1 downto 0);
                    Cout <= sum(2);
                else 
                    -- A
                    R <= A;
                    Cout <= '0';
                end if;

            when others =>
                R <= (others => '0');
                Cout <= '0';
        end case;
    end process;
end Behavioral;
