-- Contador BCD a ser implementado no relógio digital
entity contadorBCD is
    port (
        clk      : in bit;                          
        rst      : in bit;                          
        en       : in bit;                          
        limite   : in integer range 15 downto 0;
        fim      : out bit;
        contagem : buffer integer range 15 downto 0 
    );
end contadorBCD;

architecture comportamento of contadorBCD is
begin
    process (clk, rst, en)
    begin
        if (rst = '1') then
            contagem <= 0;
        elsif (clk'event and clk = '0') then
            if (en = '1') then
                if (contagem >= limite) then
                    contagem <= 0;
                else
                    contagem <= contagem + 1;
                end if;
            end if;
        end if;
        if (contagem = 15 or contagem = limite) then
            fim <= '1';
        else
            fim <= '0';
        end if;
    end process;
end comportamento;