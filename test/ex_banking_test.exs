defmodule ExBankingTest do
  use ExUnit.Case, async: true
  doctest ExBanking

  describe "Testing the add function" do
    test "All test cases for ExBanking" do
      assert ExBanking.create_user("mohan") == :ok  
      assert ExBanking.create_user("kumar") == :ok  
      assert ExBanking.deposit("mohan", 20, "EUR") == {:ok, 20.0}
      assert ExBanking.deposit("kumar", 20, "EUR") == {:ok, 20.0}
      assert ExBanking.withdraw("mohan", 10, "EUR") == {:ok, 10.0}
      assert ExBanking.get_balance("mohan", "EUR") == {:ok, 10.0}
      assert ExBanking.send("mohan","kumar", 10, "EUR") == {:ok, 0.0, 30.0}
    end

    test "All failed test cases for ExBanking" do
      assert ExBanking.create_user("mohan") == :user_already_exists
      assert ExBanking.create_user("kumar") == :user_already_exists
      assert ExBanking.deposit("mohankumar", 20, "EUR") == :user_does_not_exist
      assert ExBanking.withdraw("mohan", 100, "EUR") == :not_enough_money
      assert ExBanking.send("mohan1","kumar", 10, "EUR") == :sender_does_not_exist
      assert ExBanking.send("mohan","kumar1", 10, "EUR") == :receiver_does_not_exist
    end
  end

end
