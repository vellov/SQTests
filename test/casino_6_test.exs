defmodule CasinoTest6 do
  use ExUnit.Case

  test "Remove player by id" do
    {:ok, pid} = Casino.start()
    Casino.add_player("playName", 100)
    assert length(Casino.list_players()) == 1
    Casino.remove_player(1)
    assert length(Casino.list_players()) == 0
    Casino.stop(pid)
  end

end
