defmodule Streamer.Binance do
  use WebSockex

  require Logger

  @stream_endpoint "wss://testnet.binance.vision/ws/"

  def start_link(symbol, state) do
    url = "#{@stream_endpoint}#{symbol}@trade"
    WebSockex.start_link(url, __MODULE__, state)
  end

  def handle_frame({type, msg}, state) do
    case Jason.decode(msg) do
      {:ok, event} ->
        handle_event(event, state)

      {:error, _} ->
        throw("Unable to parse msg: #{msg}")
    end

    {:ok, state}
  end

  def handle_event(%{"e" => "trade"} = event, state) do
    trade_event = %Streamer.Binance.TradeEvent{
      :event_type => event["e"],
      :event_time => event["E"],
      :symbol => event["s"],
      :trade_id => event["t"],
      :price => event["p"],
      :quantity => event["q"],
      :buyer_order_id => event["b"],
      :seller_order_id => event["a"],
      :trade_time => event["T"],
      :buyer_market_maker => event["m"]
    }

    Logger.info(
      "Trade event received " <>
        "#{trade_event.symbol}@#{trade_event.price}"
    )

    Phoenix.PubSub.broadcast(Streamer.PubSub, "trade:#{trade_event.symbol}", trade_event)
  end
end
