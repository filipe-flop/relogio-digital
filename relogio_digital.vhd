-- Relógio digital referente à parte 3 da prática
entity relogio_digital is
  port (
        clk                     : in bit;                          
        rst                     : in bit;
        en                      : in bit;
        fim : out bit;
        unidade_segundos, dezena_segundos, unidade_minutos, dezena_minutos : buffer integer range 15 downto 0
    );
end relogio_digital;

architecture comportamento of relogio_digital is
component contadorBCD2 is
    port (
        clk      : in bit;                          
        rst      : in bit;                          
        en       : in bit;                          
        limite   : in integer range 15 downto 0;
        fim      : out bit;
        contagem : buffer integer range 15 downto 0 
    );
end component;
-- sinais intermediários das saídas das portas "fim" dos contadores e entradas das portas "en"
signal s0, s1, s2, s3, s4: bit;
begin
cont_unidade_segundos: contadorBCD2 port map(clk => clk, rst => rst, en => en, limite => 9, fim => s0, contagem => unidade_segundos);
cont_dezena_segundos : contadorBCD2 port map(clk => clk, rst => rst, en => s0, limite => 5, fim => s1, contagem => dezena_segundos);
cont_unidade_minutos : contadorBCD2 port map(clk => clk, rst => rst, en => s2, limite => 9, fim => s3, contagem => unidade_minutos);
cont_dezena_minutos  : contadorBCD2 port map(clk => clk, rst => rst, en => s4, limite => 5, fim => fim, contagem => dezena_minutos);

s2 <= s0 and s1;        -- condição para ativar o enable do cont_unidade_minutos
s4 <= s3 and s1 and s0; -- condição para ativar o enable do cont_dezena_minutos
end comportamento;