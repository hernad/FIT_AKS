library ieee;
use ieee.std_logic_1164.all;


entity OR_gate is
port(	x: in bit;
	y: in bit;
	F: out bit
);
end OR_gate;

architecture rtl of or_gate is 
begin 

    F <= x or y; 

end rtl;

