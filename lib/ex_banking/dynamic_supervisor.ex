defmodule ExBanking.DynamicSupervisor do

    use DynamicSupervisor

    def start_link() do
        DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
    end

    @moduledoc """
    Provides a function `create_user` to create user module.
    """

    @doc """
    Create a new user
    ## Parameters

        - name: String that represents the name of the user.

        Returns `:ok`.

    ## Examples

        iex> ExBanking.create_user("mohan")
        :ok

    """
    @spec create_user(user :: String.t()) :: :ok | :wrong_arguments
    def create_user(user) do
        case DynamicSupervisor.start_child(
                ExBanking.DynamicSupervisor,
                %{
                :id => user,
                :start => {ExBanking.User, :start_link, [String.to_atom(user)]}
                }
            ) do
        {:ok, _} -> :ok
        {:error, {:already_started, _}} -> :user_already_exists
        end
    end

    def init(_arg) do
        DynamicSupervisor.init(strategy: :one_for_one)
    end
end