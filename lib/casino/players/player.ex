defmodule Casino.Players.Player do
  def start_link(balance) when balance < 0 do
    raise ArgumentError, message: "balance can't be negative"
  end
  def start_link(balance) do
    Agent.start_link(fn -> balance end, [])
  end

  @doc """
  Check the balance
  """
  def balance(pid) do
    Agent.get(pid, &(&1))
  end
end
