defmodule Main do
  def run do
    valores = ler()

    case o_que_fazer() do
      "1" ->
        media(valores)
        |> imprimir("Media: ")

      "2" ->
        diferenca_maior_menor(valores)
        |> imprimir("Diferenca: ")

      "3" ->
        produto(valores)
        |> imprimir("Produto: ")

      "4" ->
        divisao(valores)
        |> imprimir("Divisao")

      _ ->
        IO.puts("NADA")
    end
  end

  defp ler() do
    IO.gets("Insira dois inteiros separados por ' ': ")
    |> String.trim()
    |> String.split()
    |> Enum.map(fn x -> String.to_integer(x) end)
  end

  defp o_que_fazer() do
    IO.gets("O que fazer?
      \t1. Média
      \t2. Diferença do maior para o menor
      \t3. Produto
      \t4. Divisao primeiro pelo segundo\n\t-> ")
    |> String.trim()
  end

  defp media(lista) do
    Enum.sum(lista) / Enum.count(lista)
  end

  defp diferenca_maior_menor(lista) do
    Enum.max(lista) - Enum.min(lista)
  end

  defp produto(lista) do
    Enum.product(lista)
  end

  defp divisao([num1, num2]) do
    num1 / num2
  end

  defp imprimir(num, text) do
    IO.puts("#{text}: #{num}")
  end
end

Main.run()
