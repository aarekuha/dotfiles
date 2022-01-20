#!/bin/python
import requests


def getPrice(pair):
    ask = bid = '---'
    try:
        crypto = requests.get(f"https://www.binance.com/api/v3/depth?symbol={pair}&limit=5").json()
        ask = round(float(crypto['asks'][0][0]), 2)
        bid = round(float(crypto['bids'][0][0]), 2)
    except:
        pass

    return (ask, bid)


askBNB, _ = getPrice('BNBUSDT')
askBTC, _ = getPrice('BTCUSDT')
askETH, _ = getPrice('ETHUSDT')
print(f' {askBTC}  {askETH} ﰊ {askBNB}')
