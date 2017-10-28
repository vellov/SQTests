defmodule CasinoTest8 do
  use ExUnit.Case

  test "Remove tables one by one" do
    {:ok, pid} = Casino.start()
    assert Casino.count_blackjack_tables() == 4

    Casino.remove_blackjack_table()
    Casino.remove_blackjack_table()
    Casino.remove_blackjack_table()
    Casino.remove_blackjack_table()
    assert Casino.count_blackjack_tables() == 0

    Casino.remove_blackjack_table()
    assert Casino.count_blackjack_tables() == 0

    Casino.stop(pid)
  end

end
