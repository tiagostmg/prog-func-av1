defmodule Main do
  def run do
    salario = ler_salario()
    vendas = ler_vendas()

    calcular(salario, vendas)
    |> imprimir()
  end

  defp ler_salario() do
    IO.gets("Insira o salário(float): ")
    |> String.trim()
    |> String.to_float()
  end

  defp ler_vendas() do
    IO.gets("Insira o valor das vendas(float): ")
    |> String.trim()
    |> String.to_float()
  end

  defp calcular(salario, vendas) do
    salario + 0.04 * vendas
  end

  defp imprimir(salario) do
    IO.puts("Salário final: #{salario}")
  end
end

Main.run()
