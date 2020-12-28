import sys

args = list(map(int, sys.argv[1:]))
rxToProcess = args[0]
rxPrev      = args[1]
txToProcess = args[2]
txPrev      = args[3]

rxSpeed = rxToProcess - rxPrev
txSpeed = txToProcess - txPrev

rxMeasure = "kB"
txMeasure = "kB"
rxSMeasure = "kB"
txSMeasure = "kB"

if rxToProcess > 10**9:
    rxToProcess /= 2**30
    rxMeasure    = "GB"
elif rxToProcess > 10**6:
    rxToProcess /= 2**20
    rxMeasure    = "MB"
else:
    rxToProcess /= 2**10

if txToProcess > 10**9:
    txToProcess /= 2**30
    txMeasure    = "GB"
elif txToProcess > 10**6:
    txToProcess /= 2**20
    txMeasure    = "MB"
else:
    txToProcess /= 2**10

if rxSpeed > 10**9:
    rxSpeed   /= 2**30
    rxSMeasure = "GB"
elif rxSpeed > 10**6:
    rxSpeed   /= 2**20
    rxSMeasure = "MB"
else:
    rxSpeed   /= 2**10

if txSpeed > 10**9:
    txSpeed   /= 2**30
    txSMeasure = "GB"
elif txSpeed > 10**6:
    txSpeed   /= 2**20
    txSMeasure = "MB"
else:
    txSpeed   /= 2**10

print("RX {:d}{:s} : {:d}{:s}/s | TX {:d}{:s} : {:d}{:s}/s".format(int(rxToProcess),  rxMeasure, 
                                                                   int(rxSpeed),     rxSMeasure,
                                                                   int(txToProcess),  txMeasure, 
                                                                   int(txSpeed),     txSMeasure))
