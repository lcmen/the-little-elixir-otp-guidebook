defmodule PingPong do
  def start do
    ping_pid = spawn(&ping/0)
    pong_pid = spawn(&pong/0)

    send(ping_pid, {pong_pid, :ping})
  end

  defp ping do
    receive do
      {sender_pid, :ping} ->
        IO.puts "ping"
        send(sender_pid, {self(), :pong})
      _ ->
        IO.puts "I can only respond to :ping"
    end

    ping()
  end

  defp pong do
    receive do
      {sender_pid, :pong} ->
        IO.puts "pong"
        send(sender_pid, {self(), :ping})
      _ ->
        IO.puts "I can only respond to :pong"
    end

    pong()
  end
end
