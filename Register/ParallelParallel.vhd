-- Kevin Aron Tapia Cruz
-- Parroquin Flores Alan
-- Baeza Nuñez Nayely
-- Registro AC 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ParallelParallel is
	port(
		clk : in std_logic;
		reset : in std_logic;
		parallel_in : in std_logic_vector(4 downto 0);
		parallel_out : out std_logic_vector(4 downto 0);
		sign: out std_logic
	);
end ParallelParallel;

architecture Behavioral of ParallelParallel is
	signal sign_reg : std_logic := '0';  -- Registro interno para el signo
begin	
	-- Proceso para manejar parallel_out
	process(clk, reset)
	begin
		if reset = '1' then
			parallel_out <= "00000";  -- Resetea parallel_out
		elsif rising_edge(clk) then
			parallel_out <= parallel_in;  -- Actualiza parallel_out en el flanco de reloj
		end if;
	end process;

	-- Proceso para manejar el signo
	process(clk, reset)
	begin
		if reset = '1' then
			sign_reg <= '0';  -- Resetea el signo a 0
		elsif sign_reg = '0' then
			sign_reg <= parallel_in(4);  -- Actualiza el signo con el bit correspondiente
		end if;
	end process;

	-- Asignación de salida
	sign <= sign_reg;  -- La señal de salida se asigna al registro interno del signo

end Behavioral;
