defmodule Pooly.WorkerSupervisor do
  use Supervisor

  # API
  def start_link(pool_server, {_, _, _} = mfa) do
    Supervisor.start_link(__MODULE__, [pool_server, mfa])
  end

  # Callbacks
  def init([pool_server, {m, f, a}]) do
    Process.link(pool_server)
    # To avoid having 2 workers (from `Worker.supervisor` and `PoolServer`)
    # when single one gots killed (after checkout) we are using `temporary`
    # as a restart strategy.
    worker_opts = [restart: :temporary, timeout: 5000, function: f]
    children = [worker(m, a, worker_opts)]
    opts = [strategy: :simple_one_for_one,
            max_restarts: 5,
            max_seconds: 5]
    supervise(children, opts)
  end
end
