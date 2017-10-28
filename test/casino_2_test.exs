defmodule CasinoTest2 do
  use ExUnit.Case
  test "Add player and list them" do
    {:ok, pid} = Casino.start()

    assert length(Casino.list_players()) == 0

    Casino.add_player("Philip", 100)

    assert length(Casino.list_players()) == 1

    Casino.add_player("Rudolph", 200)

    result = Casino.list_players()
    assert length(result) == 2
    assert Enum.at(result, 0) == %{balance: 100, id: 1, name: "Philip"}
    assert Enum.at(result, 1) == %{balance: 200, id: 2, name: "Rudolph"}
    Casino.stop(pid)

  end


end
