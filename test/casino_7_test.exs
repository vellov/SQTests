defmodule CasinoTest7 do
  use ExUnit.Case

  test "Remove tables when there are none" do
    {:ok, pid} = Casino.start()
    assert Casino.count_blackjack_tables() > 0
    Casino.remove_all_blackjack_tables()

    assert Casino.count_blackjack_tables() == 0

    Casino.remove_all_blackjack_tables()

    assert Casino.count_blackjack_tables() == 0
    Casino.stop(pid)
  end

end
