defmodule Main do
  def run do
    ler_dados_e_transformar()
    |> calcular()
    |> imprimir()
  end

  defp ler_dados_e_transformar() do
    salario =
      IO.gets("Insira o salário (float): ")
      |> String.trim()
      |> String.to_float()

    conta1 =
      IO.gets("Insira o valor da conta 1 (float): ")
      |> String.trim()
      |> String.to_float()

    conta2 =
      IO.gets("Insira o valor da conta 2 (float): ")
      |> String.trim()
      |> String.to_float()

    [salario, conta1, conta2]
  end

  defp calcular(lista) do
    [head | tail] = lista

    valor =
      Enum.map(tail, fn x -> x * 1.04 end)
      |> Enum.sum()

    head - valor
  end

  defp imprimir(num) do
    IO.puts("Sobrará: #{num}")
  end
end

Main.run()
