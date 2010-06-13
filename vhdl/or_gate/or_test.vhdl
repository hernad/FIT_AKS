entity or_test is
end or_test;

architecture behav of or_test is
    component or_gate
        port (x, y : in bit; F : out bit);
    end component;

    for or_gate_0: or_gate use entity work.or_gate;
    signal x, y, F: bit;

begin

    or_gate_0: or_gate port map (x => x, y => y, F => F);

    process

    type pattern_type is record
        x, y : bit;
        F: bit;
    end record;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns: pattern_array :=
      (('0', '0', '0'),
       ('0', '1', '1'),
       ('1', '0', '1'),
       ('1', '0', '0'),
       ('1', '1', '1'));

    begin
        for i in patterns'range loop
            x <= patterns(i).x;
            y <= patterns(i).y;

            wait for 1 ns;

            assert F = patterns(i).F
               report "bad F value" severity error;

        end loop;

    assert false report "end of test" severity note;
    wait;

  end process;

end behav;

