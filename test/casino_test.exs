defmodule CasinoTest do
  use ExUnit.Case

#  test "Remove all players" do
#    {:ok, pid} = Casino.start()
#
#    len =  length(Casino.list_players())
#
#    Casino.add_player("Philip", 100)
#    Casino.add_player("Rudolph", 200)
#
#    assert length(Casino.list_players()) == len + 2
#    Casino.remove_all_players()
#    assert length(Casino.list_players()) == 0
#    Casino.stop(pid)
#
#  end
#
#  test "Add table and count them" do
#    #Default server starts with 4 tables
#    {:ok, pid} = Casino.start()
#
#    len = Casino.count_blackjack_tables()
#
#    Casino.add_blackjack_table(5)
#    assert Casino.count_blackjack_tables() == len + 5
#    Casino.stop(pid)
#
#  end
#
#  test "Remove all tables" do
#    {:ok, pid} = Casino.start()
#
#    assert Casino.count_blackjack_tables() > 0
#
#    Casino.remove_all_blackjack_tables()
#    assert Casino.count_blackjack_tables() == 0
#    Casino.stop(pid)
#
#  end

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
