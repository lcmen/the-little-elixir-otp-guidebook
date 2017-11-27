defmodule Sum do
  @doc """
    Implement sum/1. This function should take in a list of numbers, and return the sum of the list.
  """
  def sum([]) do
    0
  end
  def sum([ head | tail ]) do
    head + sum(tail)
  end
end
