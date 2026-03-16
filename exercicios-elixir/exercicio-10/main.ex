defmodule Main do
  def run do
    IO.puts("'0' para parar")

    ler([], IO.gets("Insira a primeira idade: "))
    |> imprimir()
  end

  defp ler(list, input) do
    n = input |> String.trim() |> String.to_integer()

    if n != 0 do
      list = list ++ [n]
      ler(list, IO.gets("Insir a próxima idade: "))
    else
      media(list)
    end
  end

  defp media(list) do
    if Enum.count(list) != 0 do
      Enum.sum(list) / Enum.count(list)
    else
      0
    end
  end

  defp imprimir(num) do
    IO.puts("Média: #{num}")
  end
end

Main.run()
