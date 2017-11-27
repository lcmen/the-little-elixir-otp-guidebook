defmodule Cache do
  use GenServer

  @name CACHE

  ## Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: CACHE])
  end

  def write(key, value) do
    GenServer.cast(@name, {:write, key, value})
  end

  def read(key) do
    GenServer.call(@name, {:read, key})
  end

  def delete(key) do
    GenServer.cast(@name, {:delete, key})
  end

  def clear do
    GenServer.cast(@name, :clear)
  end

  def exists?(key) do
    GenServer.call(@name, {:exists?, key})
  end

  ## Server API
  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:read, key}, _from, store) do
    {:reply, store[key], store}
  end

  def handle_call({:exists?, key}, _from, store) do
    {:reply, Map.has_key?(store, key), store}
  end

  def handle_cast({:write, key, value}, store) do
    new_store = Map.put(store, key, value)
    {:noreply, new_store}
  end

  def handle_cast({:delete, key}, store) do
    new_store = Map.delete(store, key)
    {:noreply, new_store}
  end

  def handle_cast(:clear, _store) do
    {:noreply, %{}}
  end
end
