defmodule Main do
  def run do
    ler()
    |> menor()
    |> imprimir()
  end

  defp ler() do
    IO.gets("Insira dois inteiros separados por ' ': ")
    |> String.trim()
    |> String.split()
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  defp menor(lista) do
    [num1 | num2] = lista
    min(num1, num2)
  end

  defp imprimir(num) do
    IO.puts("Menor: #{num}")
  end
end

Main.run()
