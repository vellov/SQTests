defmodule CasinoTableUnitTest do
  use ExUnit.Case
  import Casino.Games.Blackjack.Server
  import Casino.Games.Blackjack.Table
  import Mock

  test "close all tables when no tables left" do
    with_mock Supervisor, [which_children: fn(_el) -> [] end] do
      assert close_all_tables(0) == 0
    end
  end

  test "close all tables when 5 tables left" do
    with_mock Supervisor, [which_children: fn(_el) -> [] end] do
      assert close_all_tables(5) == 0
    end
  end

  test "close all tables when negative number" do
    with_mock Supervisor, [which_children: fn(_el) -> [] end] do
      assert close_all_tables(-1) == 0
    end
  end

  test "close single table when no tables left" do
    with_mock Supervisor, [which_children: fn(_el) -> [] end] do
      assert close_table(0) == 0
    end
  end

  test "close single table when 5 left" do
    with_mock Supervisor, [which_children: fn(_el) -> [] end] do
      assert close_table(5) == 4
    end
  end

  test "close single table when negative number" do
    with_mock Supervisor, [which_children: fn(_el) -> [] end] do
      assert close_table(-1) == 0
    end
  end

  test "close single table when nil" do
    with_mock Supervisor, [which_children: fn(_el) -> [] end] do
      assert close_table(nil) == 0
    end
  end

  test "open single table" do
    with_mock Supervisor, [start_child: fn(_e1, _e2) -> {:ok, nil} end] do
      assert is_reference(open_table(1))
    end
  end

  test "open multiple tables" do
    with_mock Supervisor, [start_child: fn(_e1, _e2) -> {:ok, nil} end] do
      assert is_reference(open_table(3)) # Only last ref is returned
    end
  end

  test "start new table through start_link" do
    {status, pid} = start_link()
    assert status == :ok
    assert is_pid(pid)
  end

end
