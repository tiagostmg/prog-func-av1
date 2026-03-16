defmodule Main do
  def run do
    leitura([], 6)
    |> calculos()
    |> imprimir()
  end

  defp leitura(list, n) when n > 0 do
    IO.puts("Pessoa #{n}")

    list =
      list ++
        [
          {
            IO.gets("Insira a idade da pessoa: ") |> String.trim() |> String.to_integer(),
            IO.gets("Insira a altura da pessoa: ") |> String.trim() |> String.to_float(),
            IO.gets("Insira o peso da pessoa: ") |> String.trim() |> String.to_float(),
            IO.gets("Insira a cor dos olhos da pessoa (A, P, V, C): ") |> String.trim(),
            IO.gets("Insira a cor do cabelo da pessoa (P, C, L, R): ") |> String.trim()
          }
        ]

    leitura(list, n - 1)
  end

  defp leitura(list, 0), do: list

  defp calculos(list) do
    {a(list), b(list), c(list), d(list)}
  end

  defp a(list) do
    # a. a quantidade de pessoas com idade superior a 50 anos e peso inferior a 60 kg;
    Enum.filter(
      list,
      fn {idade, _altura, peso, _olho, _cabelo} ->
        idade > 50 && peso < 60
      end
    )
    |> Enum.count()
  end

  defp b(list) do
    # b. a média das idades das pessoas com altura inferior a 1,50 m;
    idades =
      Enum.filter(list, fn {_idade, altura, _peso, _olho, _cabelo} -> altura < 1.50 end)
      |> Enum.map(fn {idade, _altura, _peso, _olho, _cabelo} -> idade end)

    if Enum.count(idades) > 0 do
      Enum.sum(idades) / Enum.count(idades)
    else
      0
    end
  end

  defp c(list) do
    # c. a porcentagem de pessoas com olhos azuis entre todas as pessoas analisadas;
    q_azul =
      Enum.filter(list, fn {_idade, _altura, _peso, olho, _cabelo} ->
        if olho == "A", do: true, else: false
      end)
      |> Enum.count()

    q_azul / Enum.count(list) * 100
  end

  defp d(list) do
    # d. a quantidade de pessoas ruivas e que não possuem olhos azuis.
    Enum.filter(
      list,
      fn {_idade, _altura, _peso, olho, cabelo} ->
        cabelo == "R" && olho != "A"
      end
    )
    |> Enum.count()
  end

  defp imprimir({a, b, c, d}) do
    IO.puts("Quantidade de pessoas com idade superior a 50 anos e peso inferior a 60 kg: #{a}")
    IO.puts("Média das idades das pessoas com altura inferior a 1,50 m: #{b}")
    IO.puts("Porcentagem de pessoas com olhos azuis entre todas as pessoas analisadas;: #{c}%")
    IO.puts("Quantidade de pessoas ruivas e que não possuem olhos azuis: #{d}")
  end
end

Main.run()
