
random_int = (num) ->
  Math.floor(Math.random()*num)

attach = (body, ch, num) ->
  return body if ch.length <= 0 or num < 1
  for i in [1..num]
    pos = random_int(body.length)
    body = ch + body if pos == 0
    body = [body[0..(pos-1)], ch, body[pos..body.length]].join "" if pos > 0
  return body

space = "‌‌"

module.exports = (robot) ->

  robot.respond /修論/i, (msg) ->
    text = "修論ダメです"
    for i in [1..10]
      try
        msg.reply attach(text, space, random_int(70-text.length/2))
        break
      catch err
        continue

