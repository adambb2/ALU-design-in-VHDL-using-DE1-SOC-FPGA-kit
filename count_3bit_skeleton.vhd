-- HW #3: 3-Bit Counter skeleton (change file name to count_3bit.vhd when complete).
-- ENEE 4710, Fall 2015

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

-- The 3-bit counter should accept a 1-bit input (countin) and generate an output count as a 3-bit binary number.
entity count_3bit is
	port 
	(
		countin	   : in std_logic;          					-- 1 bit input
		q 				: out std_logic_vector(2 downto 0)     -- 3 bit output vector denoting binary count
	);
end entity;

architecture count3 of count_3bit is
-- place any signal definitions or variables here
	signal cin : std_logic_vector(2 downto 0) :="000" --*Adam* signal that holds the starting value of 000

begin
	process(countin) 
	begin
		-- Detect a rising edge (or falling edge) of countin, and increment counter.
		if(rising_edge(countin)) then
            if(cin = "111") then
                cin <= "000";
            else
                cin <= cin + 1;
            end if;
				
		q <= cin;
		
	end process;
	-- place any signal/port assignments here
end count3;