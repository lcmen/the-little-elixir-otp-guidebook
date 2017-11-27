defmodule Transformer do
  @doc """
    Transform [1,[[2],3]] to [9, 4, 1] with and without the pipe operator.
  """
  def transform(list) do
    List.flatten(list)
      |> Enum.reverse
      |> Enum.map(fn(x) -> round(:math.pow(x, 2)) end)
  end
end
