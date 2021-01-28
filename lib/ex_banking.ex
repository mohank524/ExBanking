defmodule ExBanking do

  @spec create_user(user :: String.t()) :: :ok | :wrong_arguments
  def create_user(user) do
    ExBanking.DynamicSupervisor.create_user(user)
  end

  @spec deposit(user :: String.t(), amount :: number, currency :: String.t()) :: {:ok, new_balance :: number} | :wrong_arguments
  def deposit(user, amount, currency) do
    ExBanking.User.deposit(user, amount, currency)
  end

  @spec withdraw(user :: String.t(), amount :: number, currency :: String.t()) :: {:ok, new_balance :: number} | :wrong_arguments
  def withdraw(user, amount, currency) do
    ExBanking.User.withdraw(user, amount, currency)
  end

  @spec get_balance(user :: String.t(), currency :: String.t()) :: {:ok, balance :: number} | :banking_error
    def get_balance(user, currency) do
    ExBanking.User.get_balance(user, currency)
  end

  @spec send(
    from_user :: String.t(),
    to_user :: String.t(),
    amount :: number,
    currency :: String.t()
  ) :: {:ok, from_user_balance :: number, to_user_balance :: number} | :banking_error
    def send(from_user, to_user, amount, currency) do
    ExBanking.User.send(from_user, to_user, amount, currency)
  end

end
