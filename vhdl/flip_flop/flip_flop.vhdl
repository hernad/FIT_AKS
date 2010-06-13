entity flip_flop is
end flip_flop;

architecture behav of flip_flop is
    -- koristimo xor_gate komponentu u nasem sklopu
    component xor_gate
        port (x, y : in bit; f : out bit);
    end component;

    for xor_gate_0: xor_gate use entity work.xor_gate;
    for xor_gate_1: xor_gate use entity work.xor_gate;
    signal r, s, y0, x1, q, q_invert: bit;

begin

    xor_gate_0: xor_gate port map (x => r, y => y0, f => q);
    xor_gate_1: xor_gate port map (x => x1, y => s, f => q_invert);


    process

    type pattern_type is record
        s, r : bit;
        q: bit;
    end record;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns: pattern_array :=
      (('0', '0', '0'),
       ('0', '0', '0'),
       ('0', '1', '0'),
       ('1', '0', '1'),
       ('0', '1', '0'));

    begin
        for i in patterns'range loop
            r <= patterns(i).r;
            s <= patterns(i).s;
            
            -- spoji signale q i x1
            x1 <= q;
            -- spoji signale q_inv i x0
            y0 <=  q_inv;

            wait for 1 ns;

            assert F = patterns(i).q
               report "bad q value" severity error;

            assert q_inv = not patterns(i).q
               report "bad q_inv value" severity error;



        end loop;

    assert false report "end of flip_flop" severity note;
    wait;

  end process;

end behav;
