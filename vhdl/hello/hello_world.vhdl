-- hello_world.vhdl  izlaz na ekran
--                   primjer bi trebao biti portabilan - 
--                   trebao bi se moci pokrenuti kod svih VHDL vendor-implementacija
--                   koji zadovoljavaju IEEE Std. 1076-1993


entity hello_world is  -- test bench (top level program kao što je "main" u C-u)
end entity hello_world;

library STD;                            -- STD je inace automatic, ali neka ga
library IEEE;                           -- standardne IEEE biblioteke
use IEEE.std_logic_1164.all;            -- osnovni logicki tipovi
use STD.textio.all;                     -- osnovni I/O

-- I/O za logicke tipove - za ovo sam morao dati ghdl-u parametre --ieee=synopsys jer 
-- std_logic_textio nije dio standardne IEEE implementacije nego je dodatak firme synopsys 
-- http://www.mail-archive.com/ghdl-discuss@gna.org/msg00713.html
-- use IEEE.std_logic_textio.all;                                                 

architecture test of hello_world is 
  -- deklaracija varijabli
  subtype word_32 is std_logic_vector(31 downto 0);
  -- 4 kao heksadecimalni broj
  -- signal four_32 : word_32 := x"00000004";
  signal counter : integer := 55;

begin  
  -- parallel kod se ovdje izvrsava
  my_print : process is                  
             -- process je  parallel
             -- tip line dolazi iz textio
               variable my_line : line;
             begin

               
               -- zaglavlje
               
               write(my_line, string'("---------------------------------------------"));
               writeline(output, my_line);

               write(my_line, string'("Hello World from FreeHDL"));
               writeline(output, my_line);

               write(my_line, string'("---------------------------------------------"));
               writeline(output, my_line);



               -- linija 4
               -- write(my_line, string'("four_32 = "));

               -- format type std_logic_vector as hex
               -- hwrite(my_line, four_32)

               write(my_line, string'("counter= "));
               -- format counter kao integer varijablu
               write(my_line, counter);
               writeline(output, my_line);

               -- linija 5 - vrijeme
               write(my_line, string'("trenutno vrijeme "));
               write(my_line, now);
               writeline(output, my_line);

               wait for 10 ns;

               -- linija 6 - vrijeme nakon 10 ns
               write(my_line, string'("vrijeme nakon wait-a "));
               write(my_line, now);
               writeline(output, my_line);


               wait;
             end process my_print;
end architecture test;
