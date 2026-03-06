defmodule Main do
  def run do
    ler()
    |> calcular()
    |> imprimir()
  end

  defp ler() do
    IO.gets("Insira o valor do carro(float): ")
    |> String.trim()
    |> String.to_float()
  end

  defp calcular(valor) do
    cond do
      valor <= 12000 -> valor * 1.05
      valor <= 25000 -> valor * 1.25
      true -> valor * 1.35
    end
  end

  defp imprimir(valor) do
    valor_formatado = :erlang.float_to_binary(valor, decimals: 2)
    IO.puts("Valor final: #{valor_formatado}")
  end
end

Main.run()
