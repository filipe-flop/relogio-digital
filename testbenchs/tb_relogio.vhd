-- testbench do relógio digital
entity tb_relogio is
end tb_relogio;

architecture comportamento of tb_relogio is
component relogio_digital is
    port (
        clk                     : in bit;                          
        rst                     : in bit;
        en                      : in bit;
        fim : out bit;
        unidade_segundos, dezena_segundos, unidade_minutos, dezena_minutos: buffer integer range 15 downto 0
    );
end component;
signal clk, rst, en, fim, s0, s1, s2, s3, s4: bit;
signal unidade_segundos, dezena_segundos, unidade_minutos, dezena_minutos: integer range 15 downto 0;
begin
    relogio: relogio_digital port map(clk, rst, en, fim, unidade_segundos, dezena_segundos, unidade_minutos, dezena_minutos);
    process
    begin
        clk <= not clk;
        wait for 1 ns;
    end process;

    process
    begin
        rst <= '0';
        en  <= '1';
        wait for 1 ns;
    end process;
end comportamento;