defmodule Crypto do
  @doc """
    Translate crypto:md5("Tales from the Crypt"). from Erlang to Elixir.
  """
  def encrypt(text) do
    # Because crypto:md5 is deprecated, we are using crypto:hash instead
    :crypto.hash(:md5, text)
  end
end
