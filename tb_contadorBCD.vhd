-- testbench do contador BCD
entity tb_contadorBCD is
end tb_contadorBCD;
    
architecture comportamento of tb_contadorBCD is
component contadorBCD is
    port (
        clk      : in bit;                          
        rst      : in bit;                          
        en       : in bit;                          
        limite   : in integer range 15 downto 0;
        fim      : out bit;
        contagem : buffer integer range 15 downto 0 
    );
    end component;
    signal clk, rst, en, fim: bit;
    signal contagem: integer range 15 downto 0;
    begin
        -- para determinar até onde irá a contagem, basta atribuir o valor desejado à entrada "limite" abaixo
        contador_BCD: contadorBCD port map(clk => clk, rst => rst, en => en, limite => 5, fim => fim, contagem => contagem);
        process
        begin
            clk <= not clk;
            wait for 1 ns;
        end process;
    
        process
        begin

            rst <= '0';
            en <= '1';
            wait for 10 ns;

            rst <= '0';
            en <= '0';
            wait for 8 ns;

            rst <= '0';
            en <= '1';
            wait for 4 ns;

            rst <= '1';
            en <= '1';
            wait for 10 ns;
        end process;
    
    end comportamento;