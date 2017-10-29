defmodule CasinoTest do
  use ExUnit.Case

  test "Remove 1 table" do
    {:ok, pid} = Casino.start()
    Casino.add_blackjack_table()
    len = Casino.count_blackjack_tables()
    assert len > 0
    Casino.remove_blackjack_table()
    assert  Casino.count_blackjack_tables() == len - 1
    Casino.stop(pid)

  end
end
