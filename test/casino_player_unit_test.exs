defmodule CasinoPlayerUnitTest do
  use ExUnit.Case
  import Casino.Players.Player

  test "one new player with 100 balance" do
    {status, pid} = start_link(100)
    assert_player(pid, status, 100)
  end

  test "two players with different balance" do
    {status1, pid1} = start_link(5000)
    {status2, pid2} = start_link(1000)
    assert_player(pid1, status1, 5000)
    assert_player(pid2, status2, 1000)
  end

  test "player with negative balance should raise error" do
    assert_raise ArgumentError, "balance can't be negative", fn -> start_link(-100) end
  end

  defp assert_player(pid, status, expected_balance) do
    assert is_pid(pid)
    assert status == :ok
    assert balance(pid) == expected_balance
  end

end
