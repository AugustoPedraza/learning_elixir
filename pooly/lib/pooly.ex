defmodule Pooly do
  use Application

  alias Pooly.Server

  def start(_type, _args) do
    pool_config = [mfa: {Pooly.SampleWorker, :start_link, []}, size: 5]

    start_pool(pool_config)
  end

  def start_pool(pool_config) do
    Pooly.Supervisor.start_link(pool_config)
  end

  def checkout do
    Server.checkout
  end

  def checkin(worker_pid) do
    Server.checkin(worker_pid)
  end

  def status do
    Server.status
  end
end

