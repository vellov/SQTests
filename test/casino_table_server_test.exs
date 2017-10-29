defmodule CasinoTableServerTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Casino.start()
    on_exit fn ->
      assert_down(pid)
    end
  end

  test "Add table and count them" do
    len = Casino.count_blackjack_tables()
    Casino.add_blackjack_table(5)
    assert Casino.count_blackjack_tables() == len + 5
  end

  test "Remove 1 table" do
    Casino.add_blackjack_table()
    len = Casino.count_blackjack_tables()
    assert len > 0
    Casino.remove_blackjack_table()
    assert  Casino.count_blackjack_tables() == len - 1
  end

  test "Remove tables when there are none" do
    assert Casino.count_blackjack_tables() > 0
    Casino.remove_all_blackjack_tables()

    assert Casino.count_blackjack_tables() == 0

    Casino.remove_all_blackjack_tables()

    assert Casino.count_blackjack_tables() == 0
  end

  test "Remove tables one by one" do
    assert Casino.count_blackjack_tables() == 4

    Casino.remove_blackjack_table()
    Casino.remove_blackjack_table()
    Casino.remove_blackjack_table()
    Casino.remove_blackjack_table()
    assert Casino.count_blackjack_tables() == 0

    Casino.remove_blackjack_table()
    assert Casino.count_blackjack_tables() == 0
  end

  test "Remove all tables" do
    assert Casino.count_blackjack_tables() > 0
    Casino.remove_all_blackjack_tables()

    assert Casino.count_blackjack_tables() == 0
  end

  defp assert_down(pid) do
    ref = Process.monitor(pid)
    assert_receive {:DOWN, ^ref, _, _, _}
  end

end
