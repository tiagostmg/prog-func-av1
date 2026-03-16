defmodule Main do
  def run do
    ler([], 10)
    |> calcular()
    |> imprimir()
  end

  defp ler(list, n) when n > 0 do
    list = list ++ [IO.gets("Insira o número #{n}: ") |> String.trim() |> String.to_integer()]
    ler(list, n - 1)
  end

  defp ler(list, 0), do: list

  defp calcular(list) do
    {
      somar_pares(list),
      somar_impares(list)
    }
  end

  defp somar_pares(list) do
    Enum.filter(list, fn x -> rem(x, 2) == 0 end)
    |> Enum.sum()
  end

  defp somar_impares(list) do
    Enum.filter(list, fn x -> rem(x, 2) == 1 end)
    |> Enum.sum()
  end

  defp imprimir({pares, impares}) do
    IO.puts("Soma dos pares: #{pares}")
    IO.puts("Soma dos ímpares: #{impares}")
  end
end

Main.run()
