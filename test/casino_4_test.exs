defmodule CasinoTest4 do
  use ExUnit.Case


  test "Add table and count them" do
    #Default server starts with 4 tables
    {:ok, pid} = Casino.start()
    len = Casino.count_blackjack_tables()
    Casino.add_blackjack_table(5)
    assert Casino.count_blackjack_tables() == len + 5

    Casino.stop(pid)
  end

end
