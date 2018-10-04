-- HW #3: 7-segment display HEX encoder skeleton (change file name to hex_encoder.vhd when complete).
-- Note the ordering of bits!!!!! 
-- ENEE 4710, Fall 2016

library ieee;
use ieee.std_logic_1164.all;

entity hex_encoder is
port 
	(
		vin	   : in std_logic_vector(3 downto 0);
		hout 		: out std_logic_vector(6 downto 0)
	);
end entity;

architecture hex_encoder_1 of hex_encoder is
begin
-- refer to page 25 of the DE1_SOC_Users_Manual for HEX pin assignments.  Note that the 7-segment LEDs are activated when logic '0' is applied
with vin select
	hout <="1000000" when "0000", -- 0
		 "1111001" when "0001", -- 1
		 "0100100" when "0010", -- 2
		 "0110000" when "0011", -- 3
		 "0011001" when "0100", -- 4
		 "0010010" when "0101", -- 5
		 "0000010" when "0110", -- 6
		 "1111000" when "0111", -- 7
		 "0000000" when "1000", -- 8
		 "0010000" when "1001", -- 9
		 "0001000" when "1010", -- A
		 "0000011" when "1011", -- b
		 "1000110" when "1100", -- C
		 "0100001" when "1101", -- d
		 "0000110" when "1110", -- E
		 "0001110" when "1111", -- F
		 "1111111" when others; -- turn off all LEDs
end hex_encoder_1;