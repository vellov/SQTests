defmodule CasinoPlayerServerTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Casino.start()
    on_exit fn ->
      assert_down(pid)
    end
  end

  test "Add player and list them" do
    assert length(Casino.list_players()) == 0

    Casino.add_player("Philip", 100)

    assert length(Casino.list_players()) == 1

    Casino.add_player("Rudolph", 200)

    result = Casino.list_players()
    assert length(result) == 2
    assert Enum.at(result, 0) == %{balance: 100, id: 1, name: "Philip"}
    assert Enum.at(result, 1) == %{balance: 200, id: 2, name: "Rudolph"}
  end

  test "Remove player by id" do
    Casino.add_player("playName", 100)
    assert length(Casino.list_players()) == 1
    Casino.remove_player(1)
    assert length(Casino.list_players()) == 0
  end

  test "Remove player by id when id does not exist" do
    Casino.add_player("playName", 100)
    assert length(Casino.list_players()) == 1
    Casino.remove_player(1000)
    assert length(Casino.list_players()) == 1
  end

  test "Remove all players" do
    len = length(Casino.list_players())

    Casino.add_player("Philip", 100)
    Casino.add_player("Rudolph", 200)

    assert length(Casino.list_players()) == len + 2
    Casino.remove_all_players()
    assert length(Casino.list_players()) == 0
  end

  defp assert_down(pid) do
    ref = Process.monitor(pid)
    assert_receive {:DOWN, ^ref, _, _, _}
  end

end
