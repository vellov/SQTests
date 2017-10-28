defmodule CasinoTest3 do
  use ExUnit.Case

  test "Remove all players" do
    {:ok, pid} = Casino.start()

    len =  length(Casino.list_players())

    Casino.add_player("Philip", 100)
    Casino.add_player("Rudolph", 200)

    assert length(Casino.list_players()) == len + 2
    Casino.remove_all_players()
    assert length(Casino.list_players()) == 0
    Casino.stop(pid)

  end
end
