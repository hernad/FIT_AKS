library ieee;
use ieee.std_logic_1164.all;


entity xor_gate is
port(	x: in bit;
	y: in bit;
	f: out bit
);
end xor_gate;

architecture rtl of xor_gate is 
begin 

    F <= not (x or y); 

end rtl;

