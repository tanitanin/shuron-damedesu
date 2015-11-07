# Description:
#  Yukiho speaks about prime numbers
#
# Commands:
#   [number] - When number is prime number, Hubot talks us about prime numbers
#   素数 - Hubot speaks about prime numbers

module.exports = (robot) ->
  robot.hear /-?\d{1,7}/g, (msg) ->
    #msg.send msg.match[0]
    for strNum in msg.match
      num = Number(strNum)
      if(testPrimality(num) == false)
        continue

      m = num + "は素数です．修論ダメです"

      msg.send m
      return

  robot.hear /素数/i, (msg) ->
    maxNumber = 10000
    primeNumbers = getPrimeNumbers(maxNumber)
    i = Math.floor(Math.random() * primeNumbers.length)
    if i >= primeNumbers.length then i = primeNumbers - 1
    pn = primeNumbers[i]
    m = "好きな素数は" + pn + "です．修論ダメです"

    msg.send m

getPrimeNumbers = (max) ->
  if max <= 1
    return []
  primeNumbers = []
  primeNumbers.push(2)
  for n in [2..max]
    isPrime = true
    for i in [0..primeNumbers.length]
      if (primeNumbers[i] * primeNumbers[i] > n)
        break
      if 0 == (n % primeNumbers[i])
        isPrime = false
        break
    if isPrime
      primeNumbers.push(n)

  return primeNumbers

testPrimality = (num) ->
  if num <= 1
    return false
  primeNumbers = getPrimeNumbers(num)
  return (primeNumbers[primeNumbers.length - 1] == num)
