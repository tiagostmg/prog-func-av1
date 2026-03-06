defmodule Main do
  def run do
    ler_string()
    |> converter_para_int()
    |> somar_valores_na_lista()
    |> imprimir_soma()
  end

  defp ler_string do
    IO.gets("Insira 3 inteiros separados por ' ': ")
  end

  defp converter_para_int(string) do
    string
    |> String.trim()
    |> String.split()
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  defp somar_valores_na_lista(lista) do
    Enum.sum(lista)
  end

  defp imprimir_soma(soma) do
    IO.puts("A soma é #{soma}")
  end
end

Main.run()
